extends StaticBody2D

@onready var interaction_area = $InteractionArea

@export_file ("*.dtl") var gallery_sign_message

func _ready():
	interaction_area.interact = Callable (self, "_read_sign")

func _read_sign():
	Dialogic.start(gallery_sign_message)
	await Dialogic.timeline_ended
