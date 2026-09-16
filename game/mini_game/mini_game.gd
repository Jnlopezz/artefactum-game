class_name MiniGame
extends Control

@onready var fight_slider: HSlider = %FightSlider

enum EnemyState {
	NORMAL,
	ANGRY,
	WINNING
}

@export var enemy_force: float = 1.0
@export var player_force: float = 1.0
@export var curve : Curve

var enemy_state: EnemyState = EnemyState.NORMAL
var total_value  := 50.0
var current_value := 50.0

var is_moving := false
var is_active := false
var player_win := false

signal game_ended

#region Virtual ####################################################################################
func _start_mini_game() -> void:
	start_mini_game()


func _end_game() -> void:
	game_ended.emit()


#region Private ####################################################################################
func on_gui_connected(event: InputEvent) -> void:
	if not is_active: return
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			total_value = clamp(total_value + player_force, 0, 100)
			current_value = curve.sample(total_value)
			tween_slider()


func enemy_push_back() -> void:
	if not is_active: return
	total_value = clamp(total_value - enemy_force, 0, 100)
	current_value = curve.sample(total_value)
	tween_slider()
	
	randomize()
	var wait_time = randf_range(0.1, 0.3)
	await get_tree().create_timer(wait_time).timeout
	enemy_push_back()


func tween_slider() -> void:
	if is_moving: return
	is_moving = true
	var slider_tween = create_tween()
	
	slider_tween.set_trans(Tween.TRANS_LINEAR)
	slider_tween.set_ease(Tween.EASE_IN_OUT)
	
	slider_tween.tween_property(
		fight_slider,
		"value",
		current_value,
		1.5
	)
	
	await slider_tween.finished
	is_moving = false
	
	if fight_slider.value >= 100 or fight_slider.value <= 0:
		end_game()


func end_game() -> void:
	is_active = false
	player_win = fight_slider.value >= 100
	_end_game()


#endregion



#region Public #####################################################################################
func start_mini_game() -> void:
	gui_input.connect(on_gui_connected)
	enemy_state = EnemyState.NORMAL
	is_active = true
	enemy_push_back()
	show()


#endregion
