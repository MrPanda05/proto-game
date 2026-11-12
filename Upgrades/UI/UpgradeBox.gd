class_name UpgradeBox
extends PanelContainer

signal OnUpgradePicked(BaseUpgrade)

@export var currentUpgrade: BaseUpgrade
@onready var _upgradName: Label = $MarginContainer/VBoxContainer/UpgradeName
@onready var _upgradeDescription: Label = $MarginContainer/VBoxContainer/UpgradeDescriptioon
@onready var _upgradeIcon: TextureRect = $MarginContainer/VBoxContainer/UpgradeImage

func _ready() -> void:
	_upgradName.text = currentUpgrade.upgradeName
	_upgradeDescription.text = currentUpgrade.upgradeDescription
	_upgradeIcon.texture = currentUpgrade.icon

func updateUpgrade() -> void:
	_upgradName.text = currentUpgrade.upgradeName
	_upgradeDescription.text = currentUpgrade.upgradeDescription
	_upgradeIcon.texture = currentUpgrade.icon
	
func OnButtonButtonDown() -> void:
	OnUpgradePicked.emit(currentUpgrade)
