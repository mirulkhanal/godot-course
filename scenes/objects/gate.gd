extends StaticBody2D

signal gate_entered
signal gate_exited

func _on_area_2d_body_entered(_body: Node2D) -> void:
	gate_entered.emit()


func _on_area_2d_body_exited(_body: Node2D) -> void:
	gate_exited.emit()
