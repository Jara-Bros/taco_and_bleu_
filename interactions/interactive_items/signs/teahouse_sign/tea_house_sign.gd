extends StaticBody2D

@onready var interaction_area = $InteractionArea

@export_file ("*.dtl") var tea_sign_message

func _ready():
	interaction_area.interact = Callable(self, "_read_tea_sign")

func _read_tea_sign():
	Dialogic.start(tea_sign_message)
	await Dialogic.timeline_ended


