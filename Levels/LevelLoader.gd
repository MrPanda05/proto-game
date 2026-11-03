## Just tells gamemanager to start the gameplaybus
class_name LevelLoader
extends Node2D

func _ready() -> void:
	GameManager.GameEventBus.OnGameStart.emit()

func _exit_tree() -> void:
	GameManager.DestroyGameBus()
