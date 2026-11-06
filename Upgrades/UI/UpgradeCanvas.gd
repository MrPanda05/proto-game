class_name  UpgradeCanvas
extends CanvasLayer


@onready var _waveManager: WaveManager = $"../WaveManager"
@onready var _rerollButton: RerollButton = $Panel/PanelContainer/HBoxContainer/RerollButton
var _allUpgrades: Array[UpgradeBox]

func _ready() -> void:
	if(_waveManager == null): return
	visible = false
	_waveManager.OnWaveEnded.connect(ShowUpgrades)
	_rerollButton.OnRerollClicked.connect(RedoUpgrade)
	FindUpgradeCards()

func ShowUpgrades():
	visible = true

func UpgradedPicked(upgrade: BaseUpgrade):
	GameManager.GameEventBus.OnUpgradePicked.emit(upgrade)
	visible = false

func RedoUpgrade():
	print("Get other upgrades")
	pass

func FindUpgradeCards():
	if(_allUpgrades.size() != 0):
		for card in _allUpgrades:
			card.OnUpgradePicked.disconnect(UpgradedPicked)
	_allUpgrades.assign(find_children("*", "UpgradeBox", true, false))
	for card in _allUpgrades:
		card.OnUpgradePicked.connect(UpgradedPicked)
