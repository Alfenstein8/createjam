extends Node2D

var player1_screen = preload("res://scenes/winner_screen.tscn")
var player2_screen = preload("res://scenes/Player_2_winner_screen.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_player_hit():
	get_tree().change_scene_to_packed(player1_screen)

func _on_player_2_hit():
	get_tree().change_scene_to_packed(player2_screen)
