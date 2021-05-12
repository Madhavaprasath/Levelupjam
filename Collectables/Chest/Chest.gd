extends "res://Collectables/Collectable.gd"


var points=rand_range(10.0,20.0)
var player=null


func _ready():
	randomize()
func _unhandled_input(event):
	if Input.is_action_pressed("interact"):
		print("Hi")
		var temp_factor=1 if temprature==mode.hot else -1
		var ammount=temp_factor*points
		Globals.emit_change_temprature(ammount)
		#animation_stuff
		queue_free()


func do_stuff(body):
	player=body
