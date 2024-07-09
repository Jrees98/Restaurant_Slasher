extends Node2D

var current_scene = "dungeon"
var change_scene = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_enemy_spawner_hit_p():
	print("OUCH")



func _on_area_2d_body_entered(body):
	if body.is_in_group("Player"):
		change_scene = true
		change_scenes()

func change_scenes():
	if change_scene == true:
		get_tree().change_scene_to_file("res://Scenes/dungeon.tscn")
