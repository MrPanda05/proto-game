class_name UpgradeBox
extends PanelContainer

signal OnUpgradePicked

func OnButtonButtonDown() -> void:
	OnUpgradePicked.emit()
