extends CharacterBody2D

class_name Bill

@export var initial_bill_speed = 20
@export var speed_multiplier = 1.07  # 107% faster every time

var bill_speed = initial_bill_speed

func _ready():
	start_bill()

func _physics_process(delta):
	var collision = move_and_collide(velocity * bill_speed * delta)

	if(collision):
		velocity = velocity.bounce(collision.get_normal()) * speed_multiplier


func start_bill():
	randomize()
	position.x = 536
	position.y = randi_range(192, 512)
	velocity.x = [-1, 1][randi() % 2] * initial_bill_speed
	velocity.y = [-0.8, 0.8][randi() % 2] * initial_bill_speed
