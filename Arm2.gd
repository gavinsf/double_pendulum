extends Node3D  # Use 'Node3D' if using Godot 4.x

# Pendulum parameters for Arm2
var angle = -0.5
var angle_velocity = 0.0
var angle_acceleration = 0.0
var length = 5.0
var gravity = 9.81
var damping = 0.999999

func _physics_process(delta):
	angle_acceleration = - (gravity / length) * sin(angle)
	angle_velocity += angle_acceleration * delta
	angle_velocity *= damping
	angle += angle_velocity * delta
	rotation_degrees.z = rad_to_deg(angle)
