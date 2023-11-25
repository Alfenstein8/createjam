extends Node2D

# Speed of the player, pixels moved
@export var speed = 400
# Random atm, should be changed when variable is known
var screen_size
signal hit
var gangmembers = []

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
	
	position += velocity * delta * speed
	position = position.clamp(Vector2.ZERO, screen_size)
	
func _on_area_2d_body_entered(body):
	print("hej")
	if (!body.is_in_group("gangmember") || body.player_owner == self):
		return
	hide() # Player disappears after being hit.
	hit.emit()
	# Must be deferred as we can't change physics properties on a physics callback.
	#$CollisionShape2D.set_deferred("disabled", true)
	
	
	#Function to reset the players position after the game ends. Not sure if good for p2 as well?
func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
	
	
	
