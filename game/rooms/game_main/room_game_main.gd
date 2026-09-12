# @popochiu-docs-ignore-class
@tool
extends PopochiuRoom

@onready var play_button: Button = %PlayButton
@onready var quit_button: Button = %QuitButton

const Data := preload('room_game_main_state.gd')

var state: Data = load("res://game/rooms/game_main/room_game_main.tres")


#region Virtual ####################################################################################
func _on_room_entered() -> void:
	pass


func _on_room_transition_finished() -> void:
	play_button.button_down.connect(on_play_pressed)
	quit_button.button_down.connect(on_quit_pressed)


func _on_room_exited() -> void:
	play_button.button_down.disconnect(on_play_pressed)
	quit_button.button_down.disconnect(on_quit_pressed)


#endregion

#region Private ####################################################################################
func on_play_pressed() -> void:
	R.goto_room('ChapineroMap')


func on_quit_pressed() -> void:
	get_tree().quit()

#endregion
