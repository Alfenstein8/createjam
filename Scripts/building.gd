extends Node2D
var player = 1
var spawn_timer = 0
var spawn_time = 10
var enemy_scene
var spawn_radius = 50


# Called when the node enters the scene tree for the first time.
func _ready():
	enemy_scene = preload("res://scenes/enemy.tscn")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	spawner()
	
	spawn_timer -= delta

func spawner():
	if(player == 0): return
	if(spawn_timer <= 0):
		spawn_timer = spawn_time
		var new_enemy = enemy_scene.instantiate()
		var spawn_pos = Vector2(randf_range(-spawn_radius,spawn_radius),randf_range(-spawn_radius,spawn_radius))
		new_enemy.position = position+spawn_pos
		get_parent().add_child(new_enemy)
