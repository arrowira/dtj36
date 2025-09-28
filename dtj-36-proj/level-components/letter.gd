extends StaticBody2D

@export var letter = 0

var started = false
func _ready() -> void:
	$Sprite2D.frame = letter
	started = true

func _on_area_2d_area_entered(area: Area2D) -> void:
	if started:
		$Sprite2D.frame = letter+1
		$AudioStreamPlayer.play()


func _on_area_2d_area_exited(area: Area2D) -> void:
	$Sprite2D.frame = letter
