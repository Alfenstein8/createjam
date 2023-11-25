extends Area2D

var speed = 750
var player_owner
var move_dir = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += move_dir * speed * delta

func _on_bullet_body_entered(body):
	if(body.is_in_group("player")):
		if(body == player_owner):
			return
		body.hit.emit()
		body.queue_free()
		queue_free()
	if body.is_in_group("gangmember"):
		body.queue_free()
		queue_free()


