extends Node3D

# Pendulum parameters
var angle = 0.5  # Initial angle in radians (adjust as desired)
var angle_velocity = 0.0  # Angular velocity
var angle_acceleration = 0.0  # Angular acceleration
var length = 5.0  # Length of the pendulum arm (matches the Y-size)
var gravity = 9.81  # Acceleration due to gravity
var damping = 0.2# Damping factor to simulate air resistance
var x : float
var y : float
var new_pos : Vector3

@onready var end : Node3D = $"../Arm_1/MeshInstance3D/Node3D"
@onready var arm : Node3D = $"."

func _physics_process(delta):
	# Calculate angular acceleration
	angle_acceleration = - (gravity / length) * sin(angle)
	
	# Update angular velocity
	angle_velocity += angle_acceleration * delta
	
	# Apply damping
	#angle_velocity *= damping
	
	# Update angle
	angle += angle_velocity * delta

	# Apply rotation to the arm
	rotation_degrees.x = 0  # Ensure no rotation around X-axis
	rotation_degrees.y = 0  # Ensure no rotation around Y-axis
	rotation_degrees.z = rad_to_deg(angle * -1)  # Convert radians to degrees
	
	x = 5 * sin(angle)
	y = -1 * cos(angle) - 3.7
	
	new_pos = arm.position
	new_pos.x = x
	new_pos.y = y
	arm.position = new_pos
	
	
