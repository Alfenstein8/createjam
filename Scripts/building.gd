extends Node2D
var player_owner:Node2D = null
var spawn_timer = 0
var spawn_time = 3
var enemy_scene
var spawn_radius = 70
var gangmembers = []

# Called when the node enters the scene tree for the first time.
func _ready():
	enemy_scene = preload("res://scenes/gangmember.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	spawner()
	
	spawn_timer -= delta

func spawner():
	if(player_owner == null): return
	if(spawn_timer <= 0):
		spawn_timer = spawn_time
		var new_enemy:Node2D = enemy_scene.instantiate()
		var spawn_pos:Vector2 = position+Vector2(randf_range(-spawn_radius,spawn_radius),randf_range(-spawn_radius,spawn_radius))
		new_enemy.position = position
		new_enemy.building = self
		new_enemy.go_to(spawn_pos)
		new_enemy.player_owner = player_owner
		new_enemy.state = new_enemy.mv_state.IDLE
		gangmembers.append(new_enemy)
		get_parent().add_child(new_enemy)
