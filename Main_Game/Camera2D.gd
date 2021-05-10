extends Camera2D


var background_speed=40

export (NodePath)var player_path
onready var player=get_node(player_path)

onready var inital_time=OS.get_ticks_msec()


func _physics_process(delta):
	position.x+=background_speed*delta*Globals.factors[Globals.weather]["Speed"]
	if player.global_position.distance_to(global_position)>575:
		player.dead=true
	if background_speed<300:
		change_background_speed(delta)
	

func change_background_speed(delta):
	var current_time=(OS.get_ticks_msec()-inital_time)/1000
	if current_time%5==0:
		background_speed+=1
