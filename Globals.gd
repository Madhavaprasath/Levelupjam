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

var weather="Warm"
var global_run_factor=factors[weather]["Speed"]
var global_jump_factor=factors[weather]["Jump_factor"]

signal change_temprature(amount)

func emit_change_temprature(amount):
	emit_signal("change_temprature",amount)
