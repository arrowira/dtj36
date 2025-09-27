extends Node2D

func _ready() -> void:
	var levObjs = load("res://levels/level%d.tscn" % nextLevel.level).instantiate()
	add_child(levObjs)
