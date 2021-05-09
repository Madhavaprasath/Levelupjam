extends Node2D


onready var end_point=get_node("Endpoint")

var factor=0
var player=null

func _ready():
	set_physics_process(false)


func _physics_process(delta):
	if player!=null:
		var distance=global_position.distance_to(player.global_position)
		if distance>4000:
			queue_free()
func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		print("Hi")
		player=body
		set_physics_process(true)
