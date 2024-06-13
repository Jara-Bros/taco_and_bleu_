extends AnimatedSprite2D

@onready var persistent_data_has_knocked = $PersistentDataHandler
@onready var animated_sprite = $"."

var has_knocked : int = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	persistent_data_has_knocked.data_loaded.connect(set_knocked_state)
	set_knocked_state()
	await get_tree().create_timer(0.1).timeout
	play_knock()
	pass

func set_knocked_state() -> void:
	has_knocked = persistent_data_has_knocked.value

func play_knock() -> void:
	# Check to see if knock occurs
	match has_knocked:
		0:
			animated_sprite.play("knocking")
			await animated_sprite.animation_finished
			has_knocked += 1
			persistent_data_has_knocked.set_value()
		
		1: 
			animated_sprite.play("default")
			await animated_sprite.animation_finished
			has_knocked += 1
			persistent_data_has_knocked.set_value()
