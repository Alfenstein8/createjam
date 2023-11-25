extends Node2D
var spawn_timer = 0
@export var spawn_time = 3
var enemy_scene
var spawn_radius = 70
@export var player_owner:Node2D
@export var cost = 0
var gangmembers = []

# Called when the node enters the scene tree for the first time.
func _ready():
	enemy_scene = preload("res://scenes/gangmember.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	spawner()
	
	spawn_timer -= delta

func buy(player:Node2D):
	if(player.gangmembers.size() < cost): return false
	player_owner = player
	for i in cost:
		var new_gangmember = player.gangmembers.pop_back()
		gangmembers.append(new_gangmember)
		set_gangmember(new_gangmember)
	return true

func spawner():
	if(player_owner == null): return
	if(spawn_timer <= 0):
		spawn_timer = spawn_time
		var new_gangmember:Node2D = enemy_scene.instantiate()
		set_gangmember(new_gangmember)
		new_gangmember.position = position
		gangmembers.append(new_gangmember)
		get_parent().add_child(new_gangmember)

func set_gangmember(gangmember:Node2D):
	var spawn_pos:Vector2 = position+Vector2(randf_range(-spawn_radius,spawn_radius),randf_range(-spawn_radius,spawn_radius))
	gangmember.building = self
	gangmember.go_to(spawn_pos)
	gangmember.player_owner = player_owner
	gangmember.state = gangmember.mv_state.IDLE
