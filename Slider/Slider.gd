extends Node2D


func _ready():
	Globals.connect("change_temprature",self,"_onchanging")

func _onchanging(ammount):
	Globals.temprature+=ammount
	$Tween.interpolate_property($slide,"position:x",$slide.position.x,Globals.temprature,
								0.1,Tween.TRANS_SINE,Tween.EASE_IN_OUT)
	$Tween.start()
