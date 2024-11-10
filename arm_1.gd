extends Node3D

# Pendulum parameters
var angle = 0.5  # Initial angle in radians (adjust as desired)
var angle_velocity = 0.0  # Angular velocity
var angle_acceleration = 0.0  # Angular acceleration
var length = 5.0  # Length of the pendulum arm (matches the Y-size)
var gravity = 9.81  # Acceleration due to gravity
var damping = 0.2  # Damping factor to simulate air resistance

func _ready():
	# check length is positive
	assert(length > 0, "Pendulum length must be positive.")
	# initial angle is within a reasonable range (here, -Pi to Pi)
	assert(angle >= -PI and angle <= PI, "Initial angle must be within -PI to PI radians.")

func _physics_process(delta):
	# ensure that delta time is positive
	assert(delta > 0, "Delta time must be positive.")

	# Calculate angular acceleration
	angle_acceleration = - (gravity / length) * sin(angle)

	# Update angular velocity
	angle_velocity += angle_acceleration * delta

	# Apply damping (optional, uncomment if needed)
	# angle_velocity *= damping

	# Update angle
	angle += angle_velocity * delta

	# Apply rotation to the arm
	rotation_degrees.x = 0  # Ensure no rotation around X-axis
	rotation_degrees.y = 0  # Ensure no rotation around Y-axis
	rotation_degrees.z = rad_to_deg(angle)  # Convert radians to degrees

	#rotation degrees remain valid
	assert(rotation_degrees.z >= -180 and rotation_degrees.z <= 180, "Rotation degrees out of bounds.")
