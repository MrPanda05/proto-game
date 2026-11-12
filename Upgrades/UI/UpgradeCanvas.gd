class_name  UpgradeCanvas
extends CanvasLayer


@onready var _waveManager: WaveManager = $"../WaveManager"
@onready var _rerollButton: RerollButton = $Panel/PanelContainer/HBoxContainer/RerollButton
var _allUpgrades: Array[UpgradeBox]
@export var _upgradeResource: Array[BaseUpgrade]

func _ready() -> void:
	if(_waveManager == null): return
	visible = false
	_waveManager.OnWaveEnded.connect(ShowUpgrades)
	_rerollButton.OnRerollClicked.connect(RedoUpgrade)
	const path = "res://Upgrades/UpgradeResources/"
	for file_name in ResourceLoader.list_directory(path):
		_upgradeResource.append(load(path.path_join(file_name)))
	FindUpgradeCards()

func ShowUpgrades():
	RollUpgrades()
	visible = true

func RollUpgrades() -> void:
#	pegar upgrades disponíveis pelos Resources
	var indice = 0
	for card in _allUpgrades:
		indice = randi_range(0, _upgradeResource.size()-1)
		card.currentUpgrade = _upgradeResource[indice]
		card.updateUpgrade()

func UpgradedPicked(upgrade: BaseUpgrade):
	GameManager.GameEventBus.OnUpgradePicked.emit(upgrade)
	GameManager.CurrentState = GameManager.States.PLAYING
	visible = false

func RedoUpgrade():
	print("Get other upgrades")
	RollUpgrades()
	pass

func FindUpgradeCards():
	if(_allUpgrades.size() != 0):
		for card in _allUpgrades:
			card.OnUpgradePicked.disconnect(UpgradedPicked)
	_allUpgrades.assign(find_children("*", "UpgradeBox", true, false))
	for card in _allUpgrades:
		card.OnUpgradePicked.connect(UpgradedPicked)
