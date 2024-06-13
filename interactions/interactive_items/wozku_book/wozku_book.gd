extends StaticBody2D

@onready var interaction_area = $InteractionArea

@export_file ("*.dtl") var wozku_book

var player_move_left
var player_move_right
var player_move_up
var player_move_down

func _ready():
	interaction_area.interact = Callable (self, "_read_wozku_book")


func disable_player_movement():
	player_move_left = InputMap.action_get_events("move_left")
	player_move_right = InputMap.action_get_events("move_right")
	player_move_up = InputMap.action_get_events("move_up")
	player_move_down = InputMap.action_get_events("move_down")
	InputMap.action_erase_events("move_left")
	InputMap.action_erase_events("move_right")
	InputMap.action_erase_events("move_up")
	InputMap.action_erase_events("move_down")

func enable_player_movement():
	for input_event in player_move_left:
		InputMap.action_add_event("move_left", input_event)
	for input_event in player_move_right:
		InputMap.action_add_event("move_right", input_event)
	for input_event in player_move_up:
		InputMap.action_add_event("move_up", input_event)
	for input_event in player_move_down:
		InputMap.action_add_event("move_down", input_event)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _read_wozku_book():
	disable_player_movement()
	Dialogic.start(wozku_book)
	await Dialogic.timeline_ended
	enable_player_movement()
