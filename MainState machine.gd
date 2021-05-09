extends Node

class_name state_machine

var states={}
var current_state
var previous_state


onready var parent=get_parent()

func _physics_process(delta):
	state_logic(delta)
	if transition(delta) !=null:
		previous_state=current_state
		current_state=transition(delta)
		enter_state(current_state,previous_state)
		exit_state(current_state,previous_state)


func state_logic(delta):
	pass
	

func transition(delta):
	return null

func enter_state(new_state,old_state):
	pass

func exit_state(new_state,old_state):
	pass


