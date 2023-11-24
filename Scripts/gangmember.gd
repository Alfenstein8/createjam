extends Node2D
var target
@export var movement_speed = 50

# Called when the node enters the scene tree for the first time.
func _ready():
	target = Vector2(200,200)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position = position.move_toward(target, movement_speed*delta)
	
