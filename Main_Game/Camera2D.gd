extends Camera2D


var background_speed=100

export (NodePath)var player_path
onready var player=get_node(player_path)
onready var inital_time=OS.get_ticks_msec()


func _physics_process(delta):
	position.x+=(background_speed+(Globals.determine_velocity(Globals.global_run_factor)))*delta
	if player.global_position.distance_to(global_position)>575:
		player.dead=true

