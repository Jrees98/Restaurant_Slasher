extends CharacterBody2D
@onready var player = get_node("/root/Dungeon/Player")
var entered : bool
var speed : int = 50
var direction : Vector2

func _ready():
	var screen_rect = get_viewport_rect()
	var dist = screen_rect.get_center() - position
	if abs(dist.x) > abs(dist.y):
		#move horizontally
		direction.x = dist.x
		direction.y = 0
	else:
		#move vertically
		direction.x = 0
		direction.y = dist.y

func _physics_process(delta):
	direction = (player.position - position)
	direction = direction.normalized()
	velocity = direction * speed
	move_and_slide()
	
