extends KinematicBody2D

var BACKGROUND_MOVING_SPEED=200
var PLAYER_MOVEMENT_SPEED=300

#weather changes 

var factors={"Warm":{"Speed":1,
					"Jump_factor":1
					},
			"Dead_Hot":{
					"Speed":1.25,
					"Jump_factor":1.25
			},
		"Dead_cold":{
			"Speed":0.75,
			"Jump_factor":0.75
		}  }

var weather="Dead_Hot"



#kinematics
var player_velocity=Vector2()
var gravity
var Max_jump_height=4.0*32
var Min_jump_height=2.0*32

var max_jump_velocity
var min_jump_velocity

var jump_duration=0.75
#state logic
var smashing=false
var dead=false



func _ready():
	gravity=(2*Max_jump_height)/pow(jump_duration,2)
	max_jump_velocity=-sqrt(2*Max_jump_height*gravity)
	min_jump_velocity=-sqrt(2*Min_jump_height*gravity)

#Todo:create a function which increases in time
#ToDo: parent should move continusly and never back
#ToDo: player have 4 controls like jump move left right and smash down may be



func apply_movement(delta):
	var directions={'Left':Input.is_action_pressed("ui_left"),'Right':Input.is_action_pressed("ui_right")}
	var direction_x=int(directions['Right'])-int(directions['Left'])
	player_velocity.x=lerp(player_velocity.x,direction_x*PLAYER_MOVEMENT_SPEED*factors[weather]["Jump_factor"],0.2)
	player_velocity=move_and_slide(player_velocity,Vector2.UP)

func apply_gravity(delta,factor):
	player_velocity.y+=gravity*delta*factor

