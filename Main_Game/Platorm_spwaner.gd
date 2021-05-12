extends Node2D

export (NodePath) var camera_path

var Y_CORDINATE=384
var offset_vector=Vector2(rand_range(0,2.5*64),rand_range(-2.5*64,0.5*64))


var platforms={"Warm":[],
				"Dead_Hot":[],
				"Dead_cold":[]}

var platform_array=[load("res://Infinate Gen/Tiles/Dead_cold/Dead_cold_0.tscn")]
var last_platform_componets=[]
var end_position
var dead_cold_platform=[]


onready var first_platform=get_node("Platform")
onready var camera=get_node(camera_path)

func _ready():
	for i in range(5):
		platforms["Dead_cold"].append(load("res://Infinate Gen/Tiles/Dead_cold/Dead_cold_"+str(i)+".tscn"))
		platforms["Dead_Hot"].append(load("res://Infinate Gen/Tiles/Dead_hot/Dead_hot_"+str(i)+".tscn"))
	platform_array=platforms[Globals.weather]
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
	randomize()
	var platform_child=take_random_platform(platform_array).instance()
	platform_child.position=Position+offset_vector
	add_child(platform_child)
	return [platform_child,Position]

func take_random_platform(platform):
	var chance=randi()%platform.size()
	var selcted_platform=platform[chance]
	return selcted_platform


func determine_y_cordinate():
	pass
