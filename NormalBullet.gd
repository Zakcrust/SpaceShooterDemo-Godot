extends Bullet

export (int) var bullet_damage = 10
export (Vector2) var bullet_velocity = Vector2(0, -400)
signal hit(enemy_score)

var collide

func _init().(bullet_damage, bullet_velocity):
	pass

func _process(delta):
	collide = move_and_collide(velocity * delta)
	if collide != null:
		if collide is KinematicBody2D:
			if collide.is_in_group("enemies"):
				emit_signal("hit", collide.get_score())
				queue_free()
	elif global_position.y < (0 - get_texture_height()):
		queue_free()
		
func get_texture_height():
	return $Sprite.texture.get_height()
