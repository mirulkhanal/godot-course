extends CharacterBody2D
func _process(delta: float) -> void:
# direction
	var direction:Vector2 = Vector2.RIGHT
# velocity
	velocity = direction * 100
# move and slide
	move_and_slide()
