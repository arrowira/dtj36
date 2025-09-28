extends Node2D


func _on_play_pressed() -> void:
	print("clicked")
	get_tree().change_scene_to_file("res://main.tscn")
