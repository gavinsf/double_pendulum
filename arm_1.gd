extends MeshInstance3D

# Pendulum parameters
var angle = 0.5  # Initial angle in radians (adjust as desired)
var angle_velocity = 0.0  # Angular velocity
var angle_acceleration = 0.0  # Angular acceleration
var length = 5.0  # Length of the pendulum arm (matches the Y-size)
var gravity = 9.81  # Acceleration due to gravity
var damping = 0.2# Damping factor to simulate air resistance

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
	rotation_degrees.z = rad_to_deg(angle)  # Convert radians to degrees
