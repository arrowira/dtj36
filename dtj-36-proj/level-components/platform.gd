extends StaticBody2D


@export var defaultState = false
func _ready() -> void:
	$Sprite2D.frame=1
	$Collision.set_deferred("disabled", !defaultState)

func _on_area_2d_area_entered(area: Area2D) -> void:
	$AudioStreamPlayer.play()
	$Sprite2D.frame=0
	$Collision.set_deferred("disabled", false)


func _on_area_2d_area_exited(area: Area2D) -> void:
	print("exited")
	$Collision.set_deferred("disabled", !defaultState)
	$Sprite2D.frame=1
