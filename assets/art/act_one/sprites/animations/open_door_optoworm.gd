extends AnimatedSprite2D

@onready var box_open = $"."
@onready var persistent_data_has_played = $PersistentDataHandler

var has_played : int = 0

func _ready():
	persistent_data_has_played.data_loaded.connect(set_play_state)
	set_play_state()
	await get_tree().create_timer(0.1).timeout
	play_animation()
	pass

func set_play_state() -> void:
	has_played = persistent_data_has_played.value

func play_animation() -> void:
	
	match has_played:
		0:
			box_open.play("box_open")
			await box_open.animation_finished
			has_played += 1
			persistent_data_has_played.set_value()
			queue_free()
		1:
			box_open.play("default")
			await box_open.animation_finished
			has_played += 1
			persistent_data_has_played.set_value()

