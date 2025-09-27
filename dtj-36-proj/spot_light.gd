extends Node2D

@export var mouseSpeed: float = 3


func _physics_process(delta: float) -> void:
	var mp = get_viewport().get_mouse_position()
	position = position.lerp(mp, delta * mouseSpeed) 
	
