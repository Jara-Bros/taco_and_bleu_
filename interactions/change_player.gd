extends Node2D


@onready var interaction_area = $InteractionArea
@onready var persistent_data_has_changed = $PersistentDataHasChanged

var has_changed : int = 0

func _ready():
	interaction_area.interact = Callable(self, "_on_change_player")
	persistent_data_has_changed.data_loaded.connect( set_player_state )
	set_player_state()

func set_player_state():
	has_changed = persistent_data_has_changed.value

func _on_change_player():
	pass
