extends Node2D


func _physics_process(delta: float) -> void:
	look_at(get_viewport().get_mouse_position())
	if position.x > get_viewport().get_mouse_position().x+5 or position.x < get_viewport().get_mouse_position().x-5:
		if position.y > get_viewport().get_mouse_position().y+5 or position.y < get_viewport().get_mouse_position().y-5:
			transform.origin.x+=1
		
