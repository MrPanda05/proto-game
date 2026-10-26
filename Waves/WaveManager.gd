class_name WaveManager
extends Node2D


var currentWave: int = 0

signal OnWaveStarted(wave: int)
signal OnWaveEnded


func StartWave():
	print("Starting wave")
	OnWaveStarted.emit(currentWave)

func EndCurrentWave():
	currentWave += 1
	OnWaveEnded.emit()

func NextWave():
	OnWaveStarted.emit(currentWave)
	print("new wave")

func _ready() -> void:
	StartWave()
