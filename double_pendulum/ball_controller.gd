extends Node3D

var angle_1 : float = 0.0
var angle_2 : float = 0.0
var rope_length_1 : float = 1.0  # Length of the first rope
var rope_length_2 : float = 1.0  # Length of the second rope
var gravity : float = 9.81
var angular_velocity_1 : float = 0.0
var angular_velocity_2 : float = 0.0
var initial_angle_1 : float = PI / 3  # Starting angle for upper object (60 degrees)
var initial_angle_2 : float = PI / 3  # Starting angle for lower object (60 degrees)

@onready var upper_ball = $"Upper Ball"
@onready var lower_ball = $"Lower Ball"
@onready var anchor = $"Anchor"

func _ready() -> void:
	angle_1 = initial_angle_1  # initial angle for the upper object
	angle_2 = initial_angle_2  # initial angle for the lower object

func _physics_process(delta: float) -> void:
	# angular acceleration
	var angular_acceleration_1 = (-gravity / rope_length_1) * sin(angle_1)
	var angular_acceleration_2 = (-gravity / rope_length_2) * sin(angle_2)
	
	# Update angular velocities
	angular_velocity_1 += angular_acceleration_1 * delta
	angular_velocity_2 += angular_acceleration_2 * delta
	
	# Updating angles
	angle_1 += angular_velocity_1 * delta
	angle_2 += angular_velocity_2 * delta
	
	# position of the upper object
	var x_1 = anchor.position.x + rope_length_1 * sin(angle_1)
	var y_1 = anchor.position.y + rope_length_1 * cos(angle_1)
	
	# Update position of the upper
	upper_ball.position = Vector3(x_1, y_1, 0)
	
	# position of lower ball based on upper object
	var x_2 = x_1 + rope_length_2 * sin(angle_2)
	var y_2 = y_1 + rope_length_2 * cos(angle_2)
	
	# Update lower
	lower_ball.position = Vector3(x_2, y_2, 0)
	
	print("Upper Ball Position:", upper_ball.position)
	print("Lower Ball Position:", lower_ball.position)
