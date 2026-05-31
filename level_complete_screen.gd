extends Control

func _on_back_level_pressed() -> void:
	get_tree().change_scene_to_file("res://choice_level.tscn")


func _on_back_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://node_2d.tscn")
