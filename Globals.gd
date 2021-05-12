extends Node
var factors={"Warm":{"Speed":1,
					"Jump_factor":1
					},
			"Dead_Hot":{
					"Speed":1.5,
					"Jump_factor":1.5
			},
		"Dead_cold":{
			"Speed":0.75,
			"Jump_factor":0.75
		}  }

var weather="Dead_Hot"
var global_run_factor=factors[weather]["Speed"]
var global_jump_factor=factors[weather]["Jump_factor"]
var temprature=0
var collector_destionation
signal change_temprature(amount)

func _process(delta):
	temprature=clamp(temprature,-100,100)
	if temprature>=50:
		weather="Dead_Hot"
	elif temprature<=10:
		weather="Dead_cold"
	else:
		weather="Warm"


func emit_change_temprature(amount):
	emit_signal("change_temprature",amount)

func determine_velocity(move_factor):
	var times=3 if temprature>0 else 0.25
	var temp_factor=abs(temprature) if temprature>=0 else 100-abs(temprature)
	return (temp_factor+move_factor)*times
