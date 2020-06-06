extends Node2D

var enemy : PackedScene = preload("res://Scenes/Enemy.tscn")

var MAX_WIDTH : int = 400
var rng : RandomNumberGenerator

signal update_score_label(score)

func _ready():
	rng = RandomNumberGenerator.new()
	rng.randomize()
	$SpawnTimeRate.start()
	spawn_enemy()

func spawn_enemy() -> void:
	var spawn_position = position
	var x_pos = rng.randi_range(0, MAX_WIDTH)
	spawn_position.x = x_pos
	
	var new_enemy = enemy.instance()
	new_enemy.connect("add_score", self, "add_score_to_label")
	new_enemy.position = spawn_position
	add_child(new_enemy)

func add_score_to_label(score):
	DataManager.add_score(score)
	emit_signal("update_score_label", DataManager.get_score())

func _on_SpawnTimeRate_timeout():
	spawn_enemy()
