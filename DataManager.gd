extends Node

var score = 0

func set_score(value : int) -> void:
	score = value

func get_score() -> int:
	return score
	
func add_score(value : int ) -> void:
	score += value
