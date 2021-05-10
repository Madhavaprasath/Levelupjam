extends Area2D
enum mode{hot,cold}
export(mode)var temprature 


func _on_Collectable_body_entered(body):
	var amount=100 if temprature==mode.hot else -1
	$Tween.interpolate_property(self,"position",global_position,Vector2(0,0),0.5,Tween.TRANS_SINE,Tween.EASE_IN_OUT)
	$Tween.start()
	Globals.emit_change_temprature(amount)
	set_physics_process(true)
