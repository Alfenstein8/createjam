extends Node2D
var target:Vector2
@export var movement_speed = 30
@export var run_speed = 50
var building
enum mv_state {TARGET, IDLE, RUN, FOLLOW}
var state:mv_state = mv_state.TARGET
var idle_radius:float = 10
var idle_timer:float = 0
var idle_time:float = 2
var idle_target:Vector2
var player_owner:Node2D
var player_follow:Node2D
var run_dir:Vector2 = Vector2.ZERO
var nearby_gangmembers = []

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	match state:
		mv_state.TARGET:
			move(target,movement_speed,delta);
		mv_state.IDLE:
			idle(delta)
		mv_state.RUN:
			move(position+run_dir,run_speed,delta)
		mv_state.FOLLOW:
			move(player_follow.position,movement_speed,delta)
	idle_timer -= delta

func run(dir:Vector2):
	state = mv_state.RUN
	run_dir = dir

func go_to(new_target):
	target = new_target

func move(mv_target:Vector2,speed:float,delta):
	position = position.move_toward(mv_target, speed*delta)

func idle(delta):
	if(idle_timer < 0):
		idle_timer = idle_time
		idle_target = Vector2(randf_range(target.x-idle_radius,target.x+idle_radius),randf_range(target.y-idle_radius,target.y+idle_radius))
	position = position.move_toward(idle_target,movement_speed*delta)

func follow_player(player):
	player_follow = player
	state = mv_state.FOLLOW
	
