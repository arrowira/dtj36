extends Node2D

@export var mouseSpeed: float = 3


func _physics_process(delta: float) -> void:
	var mp = get_viewport().get_mouse_position()
	var mouse = get_node("mousePos")
	if mouse:
		mouse.position = mouse.position.lerp(mp, delta * mouseSpeed) 
	
	var viewport_size = get_viewport_rect().size
	var mouse_pos_normalized = mp / viewport_size
	var ll = get_node('lightLayer')
	ll.get_material().set_shader_parameter("mouse_position", mouse_pos_normalized)
