extends Node2D

var laser_scene:PackedScene = preload("res://scenes/projectiles/laser.tscn")
var grenade_scene:PackedScene = preload("res://scenes/projectiles/grenade.tscn")

func _on_gate_gate_entered() -> void:
	print("Player Entered Gate")


func _on_gate_gate_exited() -> void:
	print("Player Exited Gate")
	


func _on_player_player_shoots_grenade(pos,direction) -> void:
	var grenade:RigidBody2D = grenade_scene.instantiate()
	grenade.position = pos
	grenade.linear_velocity = direction * grenade.speed
	$Projectiles.add_child(grenade)


func _on_player_player_shoots_laser(pos,direction) -> void:
	var laser:Area2D = laser_scene.instantiate()
	laser.position = pos
	laser.rotation_degrees = rad_to_deg(direction.angle()) +90
	laser.direction = direction
	$Projectiles.add_child(laser)
