extends Enemies

export (int) var enemy_health = 10
export (int) var enemy_score = 1
export (Vector2) var enemy_velocity = Vector2(0, -150)

func _init().(enemy_health, enemy_score, enemy_velocity):
	pass

func _process(delta):
	move_and_collide(velocity * delta)

