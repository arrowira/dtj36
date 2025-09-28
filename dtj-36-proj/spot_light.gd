extends Node2D

@export var mouseSpeed: float = 3

func _ready() -> void:
	var r = get_meta('spotRadius')
	var ll = get_node('lightLayer')
	ll.get_material().set_shader_parameter("innerRad", r)

	var mousePosNode = get_node('mousePos')
	var fudge = 1.02 # get the collision area to align with the spot
	mousePosNode.scale = Vector2(r, r) * 250 * fudge

	#var obj = get_node('/root/main/levelLoader').get_children()[0].get_node('Entrance')
	#print('obj ', obj)
	#if obj:
		#print('found entrace')
		


func _physics_process(delta: float) -> void:
	var mp = get_viewport().get_mouse_position()
	var mouse = get_node("mousePos")
	if not mouse:
		return
	mouse.position = mouse.position.lerp(mp, delta * mouseSpeed) 
	
	var viewport_size = get_viewport_rect().size
	var mouse_pos_normalized = mouse.position / viewport_size
	var ll = get_node('lightLayer')
	ll.get_material().set_shader_parameter("mouse_position", mouse_pos_normalized)
