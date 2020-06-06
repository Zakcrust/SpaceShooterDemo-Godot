extends Bullet

export (int) var bullet_damage = 10
export (Vector2) var bullet_velocity = Vector2(0, -400)

var collide

func _init().(bullet_damage, bullet_velocity):
	pass

func _process(delta):
	position += bullet_velocity * delta
	if global_position.y < (0 - get_texture_height()):
		queue_free()
		
func get_texture_height():
	return $Sprite.texture.get_height()
