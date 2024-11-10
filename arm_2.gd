extends MeshInstance3D  # Use 'MeshInstance3D' if using Godot 4.x

# Pendulum parameters for Arm1
var angle = 0.5  # Initial angle in radians
var angle_velocity = 0.0  # Angular velocity
var angle_acceleration = 0.0  # Angular acceleration
var length = 5.0  # Length of Arm1 (matches the Y-size)
var gravity = 9.81  # Acceleration due to gravity
var damping = 0.995  # Damping factor to simulate air resistance

func _physics_process(delta):
	# Calculate angular acceleration (simple pendulum formula)
	angle_acceleration = - (gravity / length) * sin(angle)
	
	# Update angular velocity
	angle_velocity += angle_acceleration * delta
	
	# Apply damping to simulate air resistance
	angle_velocity *= damping
	
	# Update angle
	angle += angle_velocity * delta

	# Apply rotation to Arm1
	rotation_degrees.z = rad_to_deg(angle)
