extends Node3D

var rope_length : int = 1
var upper_pos : Vector3
var lower_pos : Vector3
var anchor_pos : Vector3
var upper_angle : float
var lower_angle : float
var x1 : float
var x2 : float
var y1 : float
var y2 : float
var v_1 : Vector3
var v_2 : Vector3
var gravity : float = 9.81
var theta_double_1 : float = 0
var theta_double_2 : float = 0
var theta_single_1 : float = 0
var theta_single_2 : float = 0
var mass_1 : int = 1
var mass_2 : int = 1

@onready var upper_ball = $"Upper Ball"
@onready var lower_ball = $"Lower Ball"
@onready var anchor = $"Anchor"

# Equations
# https://web.mit.edu/jorloff/www/chaosTalk/double-pendulum/double-pendulum-en.html

func _ready() -> void:
	anchor_pos = anchor.get_global_position() # Gets position of anchor
	pass 

func _physics_process(delta: float) -> void:
	upper_pos = upper_ball.get_global_position() # Gets position of upper ball every frame
	lower_pos = lower_ball.get_global_position() # Gets position of lower ball every frame
	
	x1 = upper_pos.x
	y1 = upper_pos.y
	x2 = lower_pos.x
	y2 = lower_pos.y
	
	# x1 = L1sin(theta1)
	upper_angle = asin(x1/rope_length) # Gets angle of upper ball from anchor
	# x2 = x1 + L2sin(theta2)
	lower_angle = asin((x2 - x1) / rope_length) # Gets angle of lower ball from upper ball
	
	theta_single_1 += get_theta_double_1(upper_angle, lower_angle, theta_single_1, theta_single_2) * (1/60)
	theta_single_2 += get_theta_double_1(upper_angle, lower_angle, theta_single_1, theta_single_2) * (1/60)
	
	v_1.x += theta_single_1 * rope_length * cos(upper_angle)
	
	
	
	
	pass
	
func get_theta_double_1(angle1, angle2, theta_single_1, theta_single_2):
	return ( \
			-1 * gravity * (2*mass_1 + mass_2) * sin(angle1) \
			- mass_2 * gravity * sin(angle1 - 2*angle2) \
			- 2*sin(angle1-angle2) * mass_2 * (theta_single_2**2 * rope_length + theta_single_1**2 * rope_length * cos(angle1-angle2)) \
			/ (rope_length * (2*mass_1 + mass_2 - mass_2 * cos(2*angle1-2*angle2))))

func get_theta_double_2(angle1, angle2, theta_single_1, theta_single_2):
	return ( \
			2*sin(angle1-angle2) * (angle1**2 * rope_length * (mass_1+mass_2)) \
			+ gravity*(mass_1+mass_2) * cos(angle1) \
			+ angle2**2 * rope_length * mass_2 * cos(angle1-angle2) \
			/ (rope_length * (2*mass_1 + mass_2 - mass_2 * cos(2*angle1 - 2*angle2))))
