@tool
extends "res://addons/popochiu/engine/interfaces/i_character.gd"

# classes ----
const PCPlayerMain := preload("res://game/characters/player_main/character_player_main.gd")
const PCNeighborNpc := preload("res://game/characters/neighbor_npc/character_neighbor_npc.gd")
const PCWatchmanNpc := preload("res://game/characters/watchman_npc/character_watchman_npc.gd")
const PCRecyclerNpc := preload("res://game/characters/recycler_npc/character_recycler_npc.gd")
const PCBuddyNpc := preload("res://game/characters/buddy_npc/character_buddy_npc.gd")
const PCManager := preload("res://game/characters/manager/character_manager.gd")
const PCDaughter := preload("res://game/characters/daughter/character_daughter.gd")
const PCDog := preload("res://game/characters/dog/character_dog.gd")
const PCPoliceman := preload("res://game/characters/policeman/character_policeman.gd")
# ---- classes

# nodes ----
var PlayerMain: PCPlayerMain : get = get_PlayerMain
var NeighborNpc: PCNeighborNpc : get = get_NeighborNpc
var WatchmanNpc: PCWatchmanNpc : get = get_WatchmanNpc
var RecyclerNpc: PCRecyclerNpc : get = get_RecyclerNpc
var BuddyNpc: PCBuddyNpc : get = get_BuddyNpc
var Manager: PCManager : get = get_Manager
var Daughter: PCDaughter : get = get_Daughter
var Dog: PCDog : get = get_Dog
var Policeman: PCPoliceman : get = get_Policeman
# ---- nodes

# functions ----
func get_PlayerMain() -> PCPlayerMain: return get_runtime_character("PlayerMain")
func get_NeighborNpc() -> PCNeighborNpc: return get_runtime_character("NeighborNpc")
func get_WatchmanNpc() -> PCWatchmanNpc: return get_runtime_character("WatchmanNpc")
func get_RecyclerNpc() -> PCRecyclerNpc: return get_runtime_character("RecyclerNpc")
func get_BuddyNpc() -> PCBuddyNpc: return get_runtime_character("BuddyNpc")
func get_Manager() -> PCManager: return get_runtime_character("Manager")
func get_Daughter() -> PCDaughter: return get_runtime_character("Daughter")
func get_Dog() -> PCDog: return get_runtime_character("Dog")
func get_Policeman() -> PCPoliceman: return get_runtime_character("Policeman")
# ---- functions

