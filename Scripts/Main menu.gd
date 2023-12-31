extends Control
var level:PackedScene = preload("res://scenes/level.tscn")
var lore:PackedScene = preload("res://scenes/lore.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_pressed():
	get_tree().change_scene_to_packed(level)


func _on_quit_pressed():
	get_tree().quit()


func _on_lore_pressed():
	get_tree().change_scene_to_packed(lore)
