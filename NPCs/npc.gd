class_name NPC extends Node2D

@export_file( "*.dtl") var dialogue_one
@export_file( "*.dtl") var dialogue_two
@export_file( "*.dtl") var dialogue_three

@onready var interaction_area: Area2D = $InteractionArea
@onready var persistent_data_has_talked = $PersistentDataHasTalked

var has_talked : int = 0

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")
	persistent_data_has_talked.data_loaded.connect( set_NPC_state )
	set_NPC_state()
	pass


func set_NPC_state() -> void:
	has_talked = persistent_data_has_talked.value


func _on_interact() -> void:
	# To change dialogue on every interaction
	match has_talked:
		0:
			Dialogic.start(dialogue_one)
			await Dialogic.timeline_ended
			has_talked += 1
			persistent_data_has_talked.set_value()
		1:
			Dialogic.start(dialogue_two)
			await Dialogic.timeline_ended
			has_talked += 2
			persistent_data_has_talked.set_value()
		_:
			Dialogic.start(dialogue_two)
			await Dialogic.timeline_ended
			persistent_data_has_talked.set_value()
	
