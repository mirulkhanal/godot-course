extends CharacterBody2D

var can_shoot_laser:bool = true
var can_shoot_grenade:bool = true

signal player_shoots_laser(pos,direction)
signal player_shoots_grenade(pos,direction)

func _process(_delta: float) -> void:
	var direction = Input.get_vector("left","right","up","down")
	velocity = direction * 500
	move_and_slide()
	
#rotate player with mouse
	look_at(get_global_mouse_position())
	
	if Input.is_action_pressed("primary action") and can_shoot_laser:
		player_shoots_laser.emit(get_random_nozzle_marker().global_position,get_player_direction())
		can_shoot_laser = false
		$LaserTimer.start()
		
		
	if Input.is_action_pressed("secondary action") and can_shoot_grenade:
		player_shoots_grenade.emit(get_random_nozzle_marker().global_position, get_player_direction())
		can_shoot_grenade = false
		$GrenadeTimer.start()

func _on_grenade_timer_timeout() -> void:
	can_shoot_grenade=true

func _on_laser_timer_timeout() -> void:
	can_shoot_laser=true
	
func get_random_nozzle_marker():
	var markers_array:Array= $MarkerNode.get_children()
	var selected_marker = markers_array[randi() % markers_array.size()]
	return selected_marker

func get_player_direction():
	var player_direction = (get_global_mouse_position() - position).normalized()
	return player_direction
