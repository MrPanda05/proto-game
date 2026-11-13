class_name MainMenu
extends Node2D


func OnButtonButtonDown() -> void:
	GameManager.CreateGameBus()
	print(get_tree().root.name)
	get_tree().change_scene_to_file("res://Levels/TestLevel.tscn")
	GameManager.CurrentState = GameManager.States.PLAYING


func OnQuitButton() -> void:
	get_tree().quit()
