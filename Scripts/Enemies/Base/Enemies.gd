extends Area2D

class_name Enemies

var velocity : Vector2
var health : int
var score : int

signal add_score(score)

func set_health(value : int) -> void:
	health = value

func get_health() -> int:
	return health
	
func set_score(value : int) -> void:
	score = value

func get_score() -> int:
	return score
	
func _init(default_health = 0, default_score = 0, default_velocity = Vector2()):
	health = default_health
	score = default_score
	velocity = default_velocity

func _process(delta):
	position += velocity * delta

func damage(value : int):
	print("enemy damaged")
	health -= value
	if health < 0:
		emit_signal("add_score", score)
		queue_free()

func check_position() -> void:
	if global_position.y > (600 + $Sprite.texture.get_height()/2) :
		queue_free()

func _on_HitBox_area_entered(area):
	if area is Bullet:
		damage(area.get_damage())
		area.queue_free()
