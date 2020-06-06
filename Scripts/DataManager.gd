extends Node

var score : int = 0
var lives : int = 3

var init_score : int
var init_lives : int

func _ready():
	init_score = score
	init_lives = lives

func set_score(value : int) -> void:
	score = value

func get_score() -> int:
	return score

func set_lives(value : int) -> void:
	lives = value

func get_lives() -> int:
	return lives

func add_score(value : int ) -> void:
	score += value

func reset_data() -> void:
	score = init_score
	lives = init_lives
