class_name Player extends CharacterBody2D

const DIR_4 = [ Vector2.RIGHT, Vector2.DOWN, Vector2.LEFT, Vector2.UP]
var cardinal_direction : Vector2 = Vector2.DOWN
var direction : Vector2 = Vector2.ZERO

var health : int = 1
var max_health : int = 3

@onready var animation_player : AnimationPlayer = $AnimationPlayer
@onready var sprite : Sprite2D = $Sprite2D
@onready var state_machine: PlayerStateMachine = $StateMachine



func _ready():
	PlayerManager.player = self
	state_machine.initialize(self)
	pass


func _process(_delta):
	
	direction = Vector2(
		Input.get_axis("move_left", "move_right"),
		Input.get_axis("move_up", "move_down")
		).normalized()
	pass
	
func _physics_process(_delta):
	move_and_slide()


func SetDirection() -> bool:
	if direction == Vector2.ZERO:
		return false
	
	var direction_id : int = int(round( (direction + cardinal_direction * 0.1).angle() / TAU * DIR_4.size() ) )
	var new_dir = DIR_4[ direction_id ]
	
	if new_dir == cardinal_direction:
		return false
	
	cardinal_direction = new_dir
	return true


func UpdateAnimation(state : String) -> void:
	animation_player.play( state + "_" + AnimDirection() )
	pass

func UpdateTacoAnimation(state : String) -> void:
	animation_player.play( state + "_taco")
	if cardinal_direction == Vector2.LEFT:
		sprite.flip_h
	

func AnimDirection() -> String:
	if cardinal_direction == Vector2.DOWN:
		return "down"
	elif cardinal_direction == Vector2.UP:
		return "up"
	elif cardinal_direction == Vector2.LEFT:
		return "left"
	else: 
		return "right"
	

func update_health() -> void:
	pass
