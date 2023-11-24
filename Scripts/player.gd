extends Node2D

# Speed of the player, pixels moved
@export var speed = 400
# Random atm, should be changed when variable is known
var screen_size

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("p1_right"):
		velocity.x += 1
	if Input.is_action_pressed("p1_left"):
		velocity.x -= 1
	if Input.is_action_pressed("p1_down"):
		velocity.y += 1
	if Input.is_action_pressed("p1_up"):
		velocity.y -= 1
	print(Input.is_action_pressed("p1_down"))
	
	
	position += velocity * delta
	#position = position.clamp(Vector2.ZERO, screen_size)
	
	
