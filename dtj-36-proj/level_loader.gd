extends Node2D

func _ready() -> void:
	var levObjs = load("res://levels/level%d.tscn" % 2).instantiate()
	print(levObjs)
	add_child(levObjs)
