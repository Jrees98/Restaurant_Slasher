extends CharacterBody2D

signal shoot

const START_SPEED : int = 200
const BOOST_SPEED : int = 400
const NORMAL_SHOT : float = 0.5
const FAST_SHOT : float = 0.1
var speed : int
var can_shoot : bool
var screen_size : Vector2

func _ready():
	speed = 200
	screen_size = get_viewport_rect().size

func get_input():
	#keyboard input
	var input_dir = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = input_dir.normalized() * speed
	
	if input_dir.x > 0:
		$AnimatedSprite2D.play("walk_right")
		$AnimatedSprite2D.flip_h = false
	if input_dir.x < 0:
		$AnimatedSprite2D.flip_h = true
	if input_dir.y > 0:
		$AnimatedSprite2D.play("walk_down")
	if input_dir.y < 0:
		$AnimatedSprite2D.play("walk_up")

func _physics_process(_delta):
	#player movement
	get_input()
	move_and_slide()
	
