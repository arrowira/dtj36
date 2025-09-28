extends StaticBody2D

@export var insetFrame = 1
@export var poppedFrame = 0

@export var defaultState = false
func _ready() -> void:
	if defaultState == true:
		$Sprite2D.frame=poppedFrame
	else:
		$Sprite2D.frame=insetFrame
	$Collision.set_deferred("disabled", !defaultState)

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.get_parent().name == "spotLight":
		$AudioStreamPlayer.play()
		$Sprite2D.frame=poppedFrame
		$Collision.set_deferred("disabled", false)


func _on_area_2d_area_exited(area: Area2D) -> void:
	if area.get_parent().name == "spotLight":
		print("exited")
		$Collision.set_deferred("disabled", !defaultState)
		if defaultState == true:
			$Sprite2D.frame=poppedFrame
		else:
			$Sprite2D.frame=insetFrame
		
