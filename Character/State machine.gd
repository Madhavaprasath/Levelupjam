extends state_machine

func _init():
	states={1:"Idle",
			2:"Run",
			3:"Jump",
			4:"Fall",
			5:"Smash",
			6:"Dead"}


func _ready():
	current_state=states[1]


func state_logic(delta):
	if !parent.dead:
		parent.apply_movement(delta)
		var factor = 6 if current_state =="Smash" else 2
		parent.apply_gravity(delta,factor)
func transition(delta):
	match current_state:
		"Idle":
			if  parent.is_on_floor():
				if parent.player_velocity.x>25:
					return states[2]
				if parent.player_velocity.y<0:
					return states[3]
			elif ! parent.is_on_floor():
				if parent.smashing:
					return states[5]
				else:
					return states[4]
			if parent.dead:
				return states[6]
		"Run":
			if parent.is_on_floor():
				if parent.player_velocity.x<25:
					return states[1]
				if parent.player_velocity.y<0:
					return states[3]
			elif !parent.is_on_floor():
				if parent.smashing:
					return states[5]
				else:
					return states[4]
			if parent.dead:
				return states[6]
		"Jump":
			if parent.is_on_floor():
				return states[1]
			elif ! parent.is_on_floor():
				if parent.smashing:
					return states[5]
				else:
					return states[4]
			if parent.dead:
				return states[6]
		"Smash":
			if parent.is_on_floor():
				return states[1]
		"Fall":
			if parent.is_on_floor():
				return states[1]
			elif !parent.is_on_floor() && parent.smashing:
				return states[5]
			if parent.dead:
				return states[6]
	return null




func _unhandled_key_input(event):
	if current_state in ["Run","Idle"]:
		if event.is_action_pressed("ui_up"):
			parent.player_velocity.y=parent.max_jump_velocity*parent.factors[parent.weather]["Jump_factor"]
		if event.is_action_released("ui_up") && parent.player_velocity.y<parent.min_jump_velocity:
			parent.player_velocity.y=parent.min_jump_velocity*parent.factors[parent.weather]["Jump_factor"]
	if current_state in ["Fall"]:
		if event.is_action_pressed("ui_down"):
			parent.smashing=true


func enter_state(new_state,old_state):
	pass

func exit_state(new_state,old_state):
	match old_state:
		"Smash":
			parent.smashing=false
			print(parent.smashing)
