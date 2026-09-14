class_name MiniGame
extends Control

@onready var click_game: CenterContainer = %ClickGame

signal game_ended

#region Virtual ####################################################################################

func _start_mini_game() -> void:
	click_game.start_mini_game()
	await click_game.mini_ended
	_end_game()


func _end_game() -> void:
	game_ended.emit()
