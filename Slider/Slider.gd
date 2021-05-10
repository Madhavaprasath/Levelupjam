extends Node2D

const speed=100

func _ready():
	Globals.connect("change_temprature",self,"_onchanging")

func _process(delta):
	Globals.collector_destionation=$slide.global_position
	$slide.position.x=clamp($slide.position.x,-100,100)
func _onchanging(ammount):
	Globals.temprature+=ammount
	var distance=Vector2(Globals.temprature,0).distance_to(Vector2($slide.position.x,0))
	var time=(distance/speed+0.5)
	$Tween.interpolate_property($slide,"position:x",$slide.position.x,Globals.temprature,
								time,Tween.TRANS_SINE,Tween.EASE_IN_OUT)
	$Tween.start()
