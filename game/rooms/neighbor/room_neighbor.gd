# @popochiu-docs-ignore-class
@tool
extends PopochiuRoom

const Data := preload('room_neighbor_state.gd')

@onready var neighbor_mini_game: MiniGame = $NeighborMiniGame

var state: Data = load("res://game/rooms/neighbor/room_neighbor.tres")


#region Virtual ####################################################################################
# Called when Popochiu loads the room. At this point the room is in the scene tree but not yet
# visible.
# Add any code you want to setup the stage before the room is shown to the player (e.g. setting
# character position and facing direction, active walkable area, props visibility, etc.).
func _on_room_entered() -> void:
	pass


# Called after the room transition completes; the room is now visible.
# Implement this to start cutscenes, play sounds, etc.
func _on_room_transition_finished() -> void:
	await C.NeighborNpc.say("Debes hacer click para jugar")
	neighbor_mini_game._start_mini_game()
	neighbor_mini_game.game_ended.connect(on_game_ended)


# Called before Popochiu unloads the room.
# At this point the screen is black, processing is disabled, and characters
# have been removed from the $Characters node.
# Implement cleanup code, handle custom data or states before leaving the room, etc. if needed.
func _on_room_exited() -> void:
	pass


#endregion

func on_game_ended() -> void:
	R.goto_room('ChapineroMap')
