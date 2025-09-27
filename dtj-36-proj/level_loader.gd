extends Node2D

func _ready() -> void:
	var num = nextLevel.level
	var levObjs = load("res://levels/level%d.tscn" % num).instantiate()
	add_child(levObjs)
	var hud: Label = get_node("/root/main/hud/levelNumber")
	hud.text = "Level %d" % num
