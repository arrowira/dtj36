extends Node2D

func _ready() -> void:
	get_node('msg').text = "Level %d passed" % (nextLevel.level - 1)

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://main.tscn") # Replace with function body.
