extends Area2D
enum mode{hot,cold}
export(mode)var temprature 

const speed=500


func _on_Collectable_body_entered(body):
	do_stuff(body)

func do_stuff(body):
	var amount=1 if temprature==mode.hot else -1
	Globals.emit_change_temprature(amount)
	queue_free()


func _on_Timer_timeout():
	queue_free()
