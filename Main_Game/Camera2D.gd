extends Camera2D


export (NodePath)var player_path
onready var player=get_node(player_path)
func _physics_process(delta):
	position.x+=20*delta
	if player.global_position.distance_to(global_position)>550:
		player.dead=true
