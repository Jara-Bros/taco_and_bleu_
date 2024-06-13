extends Node2D

@export_file( "*.dtl") var player_first_point
@export_file( "*.dtl") var player_second_point
@export_file( "*.dtl") var player_third_point

@export_file( "*.dtl") var cpu_first_point
@export_file( "*.dtl") var cpu_second_point
@export_file( "*.dtl") var cpu_third_point

@export_file( "*.dtl") var player_lost_point
@export_file( "*.dtl") var cpu_lost_point

var player_points = 0
var cpu_points = 0

@onready var paddle = $Paddle
@onready var cpu = $CPU
@onready var bill : Bill = $Bill
@onready var ui = $Bg/UI
@onready var scene_transition = $SceneTransition

func _on_CPU_scored():
	cpu_points += 1
	ui.update_cpu_points(cpu_points)
	if cpu_points == 1:
		Dialogic.start(cpu_first_point)
		await Dialogic.timeline_ended
	
	if cpu_points == 2:
		Dialogic.start(cpu_second_point)
		await Dialogic.timeline_ended
		
	if cpu_points == 3:
		Dialogic.start(cpu_third_point)
		await Dialogic.timeline_ended
		queue_free()
	scene_transition.fade_in()
	scene_transition.fade_out()
	reset_game_state()

func _on_player_scored():
	player_points += 1
	ui.update_player_points(player_points)
	if player_points == 1:
		Dialogic.start(player_first_point)
		await Dialogic.timeline_ended
	
	if player_points == 2:
		Dialogic.start(player_second_point)
		await Dialogic.timeline_ended
		
	if player_points == 3:
		Dialogic.start(player_third_point)
		await Dialogic.timeline_ended
		queue_free()
	
	scene_transition.fade_in()
	scene_transition.fade_out()
	reset_game_state()

func reset_game_state():
	cpu.position.x = 226
	cpu.position.y = 112
	paddle.position.x = 46
	paddle.position.y = 112
	bill.position.x = 128
	bill.position.y = 104
	bill.velocity = Vector2.ZERO
	cpu.linear_velocity = Vector2.ZERO
	paddle.linear_velocity = Vector2.ZERO
	bill.start_bill()
