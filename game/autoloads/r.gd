@tool
extends "res://addons/popochiu/engine/interfaces/i_room.gd"

# classes ----
const PRGameMain := preload("res://game/rooms/game_main/room_game_main.gd")
const PRChapineroMap := preload("res://game/rooms/chapinero_map/room_chapinero_map.gd")
# ---- classes

# nodes ----
var GameMain: PRGameMain : get = get_GameMain
var ChapineroMap: PRChapineroMap : get = get_ChapineroMap
# ---- nodes

# functions ----
func get_GameMain() -> PRGameMain: return get_runtime_room("GameMain")
func get_ChapineroMap() -> PRChapineroMap: return get_runtime_room("ChapineroMap")
# ---- functions

