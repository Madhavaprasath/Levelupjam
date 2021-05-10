extends Area2D
enum mode{hot,cold}
export(mode)var temprature 


func _ready():
	set_physics_process(false)
func _on_Collectable_body_entered(body):
	var amount=1 if temprature==mode.hot else -1
	$Tween.interpolate_property(self,"position",global_position,Vector2(0,0),0.5,Tween.TRANS_SINE,Tween.EASE_IN_OUT)
	$Tween.start()
	set_physics_process(true)
