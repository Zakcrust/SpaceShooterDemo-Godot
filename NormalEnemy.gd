extends Enemies

export (int) var enemy_health = 10
export (int) var enemy_score = 1
export (Vector2) var enemy_velocity = Vector2(0, 150)

signal add_score(score)

func _init().(enemy_health, enemy_score, enemy_velocity):
	pass

func _process(delta):
	position += enemy_velocity * delta


func damage(value : int):
	print("enemy damaged")
	enemy_health -= value
	if enemy_health < 0:
		emit_signal("add_score", enemy_score)
		queue_free()

func check_position() -> void:
	if global_position.y > (600 + $Sprite.texture.get_height()/2) :
		queue_free()

func _on_HitBox_area_entered(area):
	if area is Bullet:
		damage(area.get_damage())
		area.queue_free()
