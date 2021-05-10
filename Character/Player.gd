extends KinematicBody2D

var PLAYER_MOVEMENT_SPEED=300

#kinematics
var player_velocity=Vector2()
var gravity
var Max_jump_height=4.0*32
var Min_jump_height=2.0*32

var max_jump_velocity
var min_jump_velocity

onready var inital_time=OS.get_ticks_msec()

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
	player_velocity.x=lerp(player_velocity.x,direction_x*PLAYER_MOVEMENT_SPEED*Globals.global_run_factor,0.2)
	player_velocity=move_and_slide(player_velocity,Vector2.UP)
	change_speed_time(delta)


func apply_gravity(delta,factor):
	player_velocity.y+=gravity*delta*factor


func change_speed_time(delta):
	var current_time=(OS.get_ticks_msec()-inital_time)/1000
	
	if current_time%5==0 && PLAYER_MOVEMENT_SPEED<750:
		PLAYER_MOVEMENT_SPEED+=1
		if Min_jump_height<240 and Max_jump_height<300:
			Max_jump_height+=1
			Min_jump_height+=1
			update_kinematics()

func update_kinematics():
	max_jump_velocity=-sqrt(2*Max_jump_height*gravity)
	min_jump_velocity=-sqrt(2*Min_jump_height*gravity)
