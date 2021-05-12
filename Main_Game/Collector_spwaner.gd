extends Node2D

var collectables_scene=[preload("res://Collectables/Cold_Hot Collectable/Cold_collectable.tscn"),
						preload("res://Collectables/Cold_Hot Collectable/Hot_collectable.tscn")]

export (NodePath) var collectable_paths

onready var collectable=get_node(collectable_paths)


var  MAX_Y_CORDINATE=384

func _ready():
	randomize()
func choose(arr:Array):
	arr.shuffle()
	return arr.front()


func _on_Timer_timeout():
	var platform=choose(collectables_scene)
	var platform_child =platform.instance()
	var player_jump_height=get_parent().player.return_kinematics()
	platform_child.position=Vector2(global_position.x,rand_range(player_jump_height[1],MAX_Y_CORDINATE))
	collectable.add_child(platform_child)
	$Timer.wait_time=choose([0.5,1.0,2.0])
