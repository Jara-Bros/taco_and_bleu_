extends Node2D

@export_file( "*.dtl") var dialogue

@onready var collision_shape_2d = $CollisionShape2D


func _ready() -> void:
	if Engine.is_editor_hint():
		return

func _on_area_2d_body_entered(body):
	Dialogic.start(dialogue)
