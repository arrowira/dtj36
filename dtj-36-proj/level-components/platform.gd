extends StaticBody2D

func _ready() -> void:
	$Sprite2D.frame=1
	$Collision.disabled = true
func _on_area_2d_area_entered(area: Area2D) -> void:
	$Sprite2D.frame=0
	$Collision.disabled = false



func _on_area_2d_area_exited(area: Area2D) -> void:
	$Collision.disabled = true
	$Sprite2D.frame=1
