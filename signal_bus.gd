extends Node

signal play_collect_anim( ability : String)

signal facing_direction_changed(flip : bool)

signal on_transitioner_animation_finished(current_scene_path : String, new_scene_path : String) 

signal in_new_pos_in_new_scene(new_pos : bool)

signal started_game(first_start : bool)

signal on_health_lost(amount_changed : int)

signal lasers_on(laser_indentifier : String)

signal increase_max_health(health_increase : bool)

signal picked_up(picked_up : bool)
