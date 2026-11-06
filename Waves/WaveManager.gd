class_name WaveManager
extends Node2D


var currentWave: int = 1

signal OnWaveStarted(wave: int)
signal OnWaveEnded

func _ready() -> void:
	GameManager.GameEventBus.OnGameStart.connect(StartWave)
	GameManager.GameEventBus.OnUpgradePicked.connect(NextWave)

func StartWave():
	print("Starting wave")
	OnWaveStarted.emit(currentWave)
	GameManager.GameEventBus.OnWaveStarted.emit(currentWave)

func EndCurrentWave():
	currentWave += 1
	OnWaveEnded.emit()
	GameManager.GameEventBus.OnWaveEnded.emit()

func NextWave(_upgrade: BaseUpgrade = null):
	OnWaveStarted.emit(currentWave)
	GameManager.GameEventBus.OnWaveStarted.emit(currentWave)
	print("new wave")
