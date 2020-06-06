extends Control

func _ready():
	hide()

func _on_Player_game_over():
	show()
	DataManager.reset_data()
