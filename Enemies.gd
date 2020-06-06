extends Area2D

class_name Enemies

var velocity : Vector2
var health : int
var score : int

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
