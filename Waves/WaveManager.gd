class_name WaveManager
extends Node2D


var currentWave: int = 1

func _ready() -> void:
	GameManager.GameEventBus.OnGameStart.connect(StartWave)
	GameManager.GameEventBus.OnUpgradePicked.connect(NextWave)

func StartWave():
	print("Starting wave")
	GameManager.GameEventBus.OnWaveStarted.emit(currentWave)
	

func EndCurrentWave():
	currentWave += 1
	GameManager.GameEventBus.OnWaveEnded.emit()
	GameManager.CurrentState = GameManager.States.UPGRADE

func NextWave(_upgrade: BaseUpgrade = null):
	GameManager.GameEventBus.OnWaveStarted.emit(currentWave)
	print("new wave")
