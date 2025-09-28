extends Node2D

func _ready() -> void:
	var num = nextLevel.level
	var levObjs : Node = load("res://levels/level%d.tscn" % num).instantiate()
	add_child(levObjs)
	print('added levObjs')
	var hud: Label = get_node("/root/main/hud/levelNumber")
	hud.text = "Level %d" % num

	var ent = levObjs.find_child('Entrance')
	get_node('/root/main/player').position = ent.position


func _on_drown_timeout() -> void:
	get_tree().change_scene_to_file("res://main.tscn")
