## Just tells gamemanager to start the gameplaybus
class_name LevelLoader
extends Node2D

func _ready() -> void:
	GameManager.GameEventBus.OnGameStart.emit()
	GameManager.OnStateChanged.connect(CheckGlobalState)

func CheckGlobalState():
	if(GameManager.CurrentState == GameManager.States.GAMEOVER):
		process_mode = Node.PROCESS_MODE_DISABLED
