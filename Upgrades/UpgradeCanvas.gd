class_name  UpgradeCanvas
extends CanvasLayer


@onready var _waveManager: WaveManager = $"../WaveManager"

func _ready() -> void:
	_waveManager.connect("OnWaveEnded", ShowUpgrades)
	visible = false


func ShowUpgrades():
	visible = true


func OnButtonButtonDown() -> void:
	visible = false
	_waveManager.NextWave()
