extends RigidBody2D

@export var paddle_speed = 10000
@export var bill : Bill


func _physics_process(delta):
	var direction = (bill.position - position).normalized()
	linear_velocity.y = direction.y * paddle_speed * delta
