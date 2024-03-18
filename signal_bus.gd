extends Node

signal on_health_changed(node: Node, amount_changed: int)

signal facing_direction_changed(flip : bool)

signal on_transitioner_animation_finished(current_scene_path : String, new_scene_path : String) 

signal in_new_pos_in_new_scene(new_pos : bool)

signal started_game(first_start : bool)
