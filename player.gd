extends Area2D

signal dead

@export var speed = 100
var velocity = Vector2.ZERO
var screensize = Vector2(1920,1080)

# Called when the node enters the scene tree for the first time.
func _ready():
	position = screensize / 2
	$AnimatedSprite2D.animation = "idle_right"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity = Input.get_vector("move_left","move_right","move_up","move_down")
	position += velocity * speed * delta
	position.x = clamp(position.x,0,screensize.x)
	position.y = clamp(position.y,0,screensize.y)
	
	if velocity.length() > 0:
		$AnimatedSprite2D.animation = "walk_right"
	else: 
		$AnimatedSprite2D.animation = "idle_right"
	if velocity.x != 0:
		$AnimatedSprite2D.flip_h= velocity.x < 0
