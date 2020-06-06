extends Area2D

class_name Bullet

var damage : int
var velocity : Vector2

func set_damage(value : int) -> void:
	damage = value

func get_damage() -> int:
	return damage
	
func _init(default_damage = 0, default_velocity = Vector2()):
	damage = default_damage
	velocity = default_velocity
