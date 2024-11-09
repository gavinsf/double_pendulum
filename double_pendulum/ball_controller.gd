extends Node3D

var accel_1_x : float = 0
var accel_1_y : float = 0
var accel_2_x : float = 0
var accel_2_y : float = 0
var vel_1_x : float = 0
var vel_1_y : float = 0
var vel_2_x : float = 0
var vel_2_y : float = 0
var angle_1 : float
var angle_2 : float
var rope_length : float = 1
var x_1 : float
var y_1 : float
var x_2 : float
var y_2 : float
var initial_angle : float
var prev_pos : Vector3

@onready var upper_ball = $"Upper Ball"
@onready var lower_ball = $"Lower Ball"
@onready var anchor = $"Anchor"


func _ready() -> void:
	pass 

func _physics_process(delta: float) -> void:
	x_1 = upper_ball.position.x
	y_1 = upper_ball.position.y
	x_2 = lower_ball.position.x
	y_2 = lower_ball.position.y
	
	angle_1 = asin(x_1/rope_length)
	
	accel_1_x = -9.81 * sin(angle_1)
	accel_1_y = -9.81 * cos(angle_1)
	
	vel_1_x += accel_1_x / 60
	vel_1_y += accel_1_y / 60
	
	prev_pos = upper_ball.position
	upper_ball.position = prev_pos + Vector3(vel_1_x/60, vel_1_y/60, 0)
	
	print(x_1, accel_1_y, "		", angle_1)
	pass
	
