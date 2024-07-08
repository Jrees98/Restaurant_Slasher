extends Node2D

@onready var main = get_node("/root/Dungeon")

signal hit_p

var enemy_scene := preload("res://Scenes/enemy_one.tscn")
var spawn_points := []

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in get_children():
		if i is Marker2D:
			spawn_points.append(i)



func _on_timer_timeout():
	var spawn = spawn_points[randi() % spawn_points.size()]
	var enemy = enemy_scene.instantiate()
	enemy.position = spawn.position
	enemy.hit_player.connect(hit)
	main.add_child(enemy)
	
func hit():
	hit_p.emit()
