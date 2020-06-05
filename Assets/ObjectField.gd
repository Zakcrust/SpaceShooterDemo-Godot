extends Node2D

signal add_score(score)

func on_bullet_hit(score):
	emit_signal("add_score", score)


func _on_Player_shoot(player_position, bullet):
	var new_bullet = bullet.instance()
	new_bullet.position = player_position + Vector2(0, -10)
	new_bullet.connect("hit", self, "on_bullet_hit")
	add_child(new_bullet)
