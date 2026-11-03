class_name  UpgradeCanvas
extends CanvasLayer


@onready var _waveManager: WaveManager = $"../WaveManager"

func _ready() -> void:
	if(_waveManager == null): return
	_waveManager.connect("OnWaveEnded", ShowUpgrades)
	visible = false


func ShowUpgrades():
	GameManager.GameEventBus.OnUpgradePicked.emit()
	visible = true
