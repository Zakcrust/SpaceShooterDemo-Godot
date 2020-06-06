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

func _process(delta):
	position += velocity * delta
	if global_position.y < (0 - get_texture_height()):
		queue_free()
		
func get_texture_height():
	return $Sprite.texture.get_height()
