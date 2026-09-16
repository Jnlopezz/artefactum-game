@tool
extends "res://addons/popochiu/engine/interfaces/i_room.gd"

# classes ----
const PRGameMain := preload("res://game/rooms/game_main/room_game_main.gd")
const PRChapineroMap := preload("res://game/rooms/chapinero_map/room_chapinero_map.gd")
const PRNeighbor := preload("res://game/rooms/neighbor/room_neighbor.gd")
const PRWatchman := preload("res://game/rooms/watchman/room_watchman.gd")
const PRRecycler := preload("res://game/rooms/recycler/room_recycler.gd")
const PRBuddy := preload("res://game/rooms/buddy/room_buddy.gd")
const PRDeport := preload("res://game/rooms/deport/room_deport.gd")
const PRManager := preload("res://game/rooms/manager/room_manager.gd")
# ---- classes

# nodes ----
var GameMain: PRGameMain : get = get_GameMain
var ChapineroMap: PRChapineroMap : get = get_ChapineroMap
var Neighbor: PRNeighbor : get = get_Neighbor
var Watchman: PRWatchman : get = get_Watchman
var Recycler: PRRecycler : get = get_Recycler
var Buddy: PRBuddy : get = get_Buddy
var Deport: PRDeport : get = get_Deport
var Manager: PRManager : get = get_Manager
# ---- nodes

# functions ----
func get_GameMain() -> PRGameMain: return get_runtime_room("GameMain")
func get_ChapineroMap() -> PRChapineroMap: return get_runtime_room("ChapineroMap")
func get_Neighbor() -> PRNeighbor: return get_runtime_room("Neighbor")
func get_Watchman() -> PRWatchman: return get_runtime_room("Watchman")
func get_Recycler() -> PRRecycler: return get_runtime_room("Recycler")
func get_Buddy() -> PRBuddy: return get_runtime_room("Buddy")
func get_Deport() -> PRDeport: return get_runtime_room("Deport")
func get_Manager() -> PRManager: return get_runtime_room("Manager")
# ---- functions

