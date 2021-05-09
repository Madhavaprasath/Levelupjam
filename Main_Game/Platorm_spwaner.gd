extends Node2D

export (NodePath) var camera_path

const Y_CORDINATE=384

var platform_array=[preload("res://Infinate Gen/Tiles/Dead_cold/Dead_cold_1.tscn")]
var last_platform_componets=[]
var end_position

onready var first_platform=get_node("Platform")
onready var camera=get_node(camera_path)

func _ready():
	end_position=(first_platform.end_point.global_position)
	for i in range(0,6):
		spawn_platforms()



func _physics_process(delta):
	var distance=camera.global_position.distance_to(end_position)
	if distance <1500:
		spawn_platforms()

func spawn_platforms():
	last_platform_componets=spawn_platform(end_position)
	end_position=(last_platform_componets[0].end_point.global_position)

func spawn_platform(Position:Vector2)->Array:
	var platform_child=platform_array[0].instance()
	platform_child.position=Position
	add_child(platform_child)
	return [platform_child,Position]
