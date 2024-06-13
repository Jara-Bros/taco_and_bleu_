extends StaticBody2D

@onready var interaction_area : Area2D = $InteractionArea

var scene = load("res://interactions/interactive_items/TV/second_date_menu.tscn")

func _ready():
	interaction_area.interact = Callable(self, "_turn_on_tv")

func _turn_on_tv():
	var scene_instance = scene.instantiate()
	add_child(scene_instance)
	
