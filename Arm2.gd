extends Node3D # Use 'Node3D' if using Godot 4.x

# Pendulum parameters for Arm2
var angle = -0.5  # Initial angle in radians (can be different from Arm1)
var angle_velocity = 0.0  # Angular velocity
var angle_acceleration = 0.0  # Angular acceleration
var length = 5.0  # Length of Arm2
var gravity = 9.81  # Acceleration due to gravity
var damping = 0.995  # Damping factor to simulate air resistance

func _physics_process(delta):
	# Calculate angular acceleration
	angle_acceleration = - (gravity / length) * sin(angle)
	
	# Update angular velocity
	angle_velocity += angle_acceleration * delta
	
	# Apply damping
	angle_velocity *= damping
	
	# Update angle
	angle += angle_velocity * delta

	# Apply rotation to Arm2
	rotation_degrees.z = rad_to_deg(angle)
