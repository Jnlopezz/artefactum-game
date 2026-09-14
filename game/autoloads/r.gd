@tool
extends "res://addons/popochiu/engine/interfaces/i_room.gd"

# classes ----
const PRGameMain := preload("res://game/rooms/game_main/room_game_main.gd")
const PRChapineroMap := preload("res://game/rooms/chapinero_map/room_chapinero_map.gd")
const PRNeighbor := preload("res://game/rooms/neighbor/room_neighbor.gd")
const PRWatchman := preload("res://game/rooms/watchman/room_watchman.gd")
# ---- classes

# nodes ----
var GameMain: PRGameMain : get = get_GameMain
var ChapineroMap: PRChapineroMap : get = get_ChapineroMap
var Neighbor: PRNeighbor : get = get_Neighbor
var Watchman: PRWatchman : get = get_Watchman
# ---- nodes

# functions ----
func get_GameMain() -> PRGameMain: return get_runtime_room("GameMain")
func get_ChapineroMap() -> PRChapineroMap: return get_runtime_room("ChapineroMap")
func get_Neighbor() -> PRNeighbor: return get_runtime_room("Neighbor")
func get_Watchman() -> PRWatchman: return get_runtime_room("Watchman")
# ---- functions

