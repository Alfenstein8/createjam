extends StaticBody2D

# Speed of the player, pixels moved
@export var speed = 400
@export var player_num = 1
# Random atm, should be changed when variable is known
var screen_size
signal hit
var gangmembers = []
var buildings_in_range = []
var bullet = preload("res://scenes/bullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	if player_num == 1:
		if Input.is_action_pressed("p1_right"):
			velocity.x += 1
		if Input.is_action_pressed("p1_left"):
			velocity.x -= 1
		if Input.is_action_pressed("p1_down"):
			velocity.y += 1
		if Input.is_action_pressed("p1_up"):
			velocity.y -= 1
		if Input.is_action_just_pressed("p1_shoot"):
			shoot()
		if Input.is_action_pressed("p1_interact"):
			if (!buildings_in_range.is_empty()):
				buildings_in_range[0].buy(self)
		if Input.is_action_pressed("p1_follow"):
			if !buildings_in_range.is_empty():
				buildings_in_range[0].pick_up_gangmembers(self)
	if player_num == 2:
		if Input.is_action_pressed("p2_right"):
			velocity.x += 1
		if Input.is_action_pressed("p2_left"):
			velocity.x -= 1
		if Input.is_action_pressed("p2_down"):
			velocity.y += 1
		if Input.is_action_pressed("p2_up"):
			velocity.y -= 1
		if Input.is_action_just_pressed("p2_shoot"):
				shoot()
		if Input.is_action_pressed("p2_interact"):
			if (!buildings_in_range.is_empty()):
				buildings_in_range[0].buy(self)
		if Input.is_action_pressed("p2_follow"):
			if !buildings_in_range.is_empty():
				buildings_in_range[0].pick_up_gangmembers(self)

	position += velocity * delta * speed
	position = position.clamp(Vector2.ZERO, screen_size)
	
func _on_area_2d_body_entered(body):
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
	
func _on_interact_range_entered(body):
	if (body.is_in_group("building") && body.player_owner != self):
		buildings_in_range.append(body)

func _on_interact_range_body_exited(body):
	if (body.is_in_group("building")):
		var building_index = buildings_in_range.find(body)
		buildings_in_range.pop_at(building_index)
		
func shoot():
	var new_bullet = bullet.instantiate()
	new_bullet.position = position
	get_parent().add_child(new_bullet)
	
	
