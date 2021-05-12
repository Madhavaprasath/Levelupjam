extends KinematicBody2D

var PLAYER_MOVEMENT_SPEED=300

#kinematics
var player_velocity=Vector2()
var gravity
var Max_jump_height=3.0*64
var Min_jump_height=2.5*64

var max_jump_velocity
var min_jump_velocity

onready var inital_time=OS.get_ticks_msec()

var jump_duration=0.75
#state logic
var smashing=false
var dead=false
var direction_x

func _ready():
	gravity=(2*Max_jump_height)/pow(jump_duration,2)
	max_jump_velocity=-sqrt(2*Max_jump_height*gravity)
	min_jump_velocity=-sqrt(2*Min_jump_height*gravity)
	
#Todo:create a function which increases in time
#ToDo: parent should move continusly and never back
#ToDo: player have 4 controls like jump move left right and smash down may be



func apply_movement(delta):
	var directions={'Left':Input.is_action_pressed("ui_left"),'Right':Input.is_action_pressed("ui_right")}
	direction_x=int(directions['Right'])-int(directions['Left'])
	player_velocity.x=lerp(player_velocity.x,direction_x*(PLAYER_MOVEMENT_SPEED+Globals.determine_velocity(Globals.global_run_factor)),0.4)
	player_velocity=move_and_slide(player_velocity,Vector2.UP)

func apply_gravity(delta,factor):
	player_velocity.y+=gravity*delta*factor


func update_kinematics():
	max_jump_velocity=-sqrt(2*(Max_jump_height+Globals.determine_velocity(Globals.global_jump_factor))*gravity)
	min_jump_velocity=-sqrt(2*(Min_jump_height+Globals.determine_velocity(Globals.global_jump_factor))*gravity)


func return_kinematics()->Array:
	return [Max_jump_height+Globals.determine_velocity(Globals.global_jump_factor),Min_jump_height+Globals.determine_velocity(Globals.global_jump_factor)]


func fall_through_platform():
	if is_on_floor():
		set_collision_mask_bit(1,false)

func cancel_fall_trough():
	if get_collision_mask_bit(1)==false:
		print("Changed")
		set_collision_mask_bit(1,true)
