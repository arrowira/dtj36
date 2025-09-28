extends Node

var level = 1

func finishedLevel():
	nextLevel.level += 1
	
	get_tree().change_scene_to_file("res://congrats.tscn")
	
