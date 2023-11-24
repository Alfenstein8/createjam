extends Node2D
var target:Vector2
@export var movement_speed = 30
var building
enum mv_state {TARGET, IDLE}
var state:mv_state = mv_state.IDLE
var idle_radius:float = 10
var idle_timer:float = 0
var idle_time:float = 2
var idle_target:Vector2
var player_owner:Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	match state:
		mv_state.TARGET:
			move(delta);
		mv_state.IDLE:
			idle(delta)
			
	idle_timer -= delta

func go_to(new_target):
	target = new_target
	state = mv_state.TARGET

func move(delta):
	position = position.move_toward(target, movement_speed*delta)

func idle(delta):
	if(idle_timer < 0):
		idle_timer = idle_time
		idle_target = Vector2(randf_range(target.x-idle_radius,target.x+idle_radius),randf_range(target.y-idle_radius,target.y+idle_radius))
	position = position.move_toward(idle_target,movement_speed*delta)
