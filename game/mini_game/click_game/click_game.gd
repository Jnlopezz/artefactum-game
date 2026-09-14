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

signal mini_ended

#func _ready() -> void:
	#start_mini_game()
	
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
	mini_ended.emit()


#endregion



#region Public #####################################################################################
func start_mini_game() -> void:
	gui_input.connect(on_gui_connected)
	enemy_state = EnemyState.NORMAL
	is_active = true
	enemy_push_back()
	show()


#endregion

#func click_pressed() -> void:
	#progress_barr.value += grow_factor
	#if not current_tween == null:
		#current_tween.kill()
	#
	#tween_backwards()
	#
	#if progress_barr.value >= 100:
		#end_mini_game(true)
#
#
#func end_mini_game(result: bool) -> void:
	#current_tween.kill()
	#timer_tween.kill()
	#
	#reset_values()
	#
	#if level +1 == levels.size():
		#emit_signal('mini_ended')
		#return
	#
	#level += 1 if result else 0 
	#assign_level_data()
	#emit_signal("next_mini_game", !result)
#
#
#func reset_values() -> void:
	#var tween = get_tree().create_tween().set_parallel().set_trans(Tween.TRANS_BOUNCE).set_ease(Tween.EASE_OUT)
	#tween.tween_property(
		#progress_barr, 'value', 
		#0.0, 1.0).set_delay(0.5)
	#tween.tween_property(
		#timer, 'value', 
		#100.0, 1.0).set_delay(0.5)
#
#
#func assign_level_data() -> void:
	#grow_factor = levels[level].grow
	#back_factor = levels[level].back
	#time = levels[level].timer
#
#
#func time_progress_down() -> void:
	#timer.value = 100.0
	#timer_tween = get_tree().create_tween()
	#timer_tween.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	#
	#timer_tween.tween_property(
		#timer, 'value', 
		#0.0, time)
	#
	#await timer_tween.finished
	#end_mini_game(false)
#
#
#func tween_backwards() -> void:
	#var duration = progress_barr.value / back_factor
	#
	#current_tween = get_tree().create_tween()
	#current_tween.tween_property(
		#progress_barr, 'value', 
		#0.0, duration).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
