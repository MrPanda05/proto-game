class_name RerollButton
extends PanelContainer

signal OnRerollClicked

func OnButtonButtonDown() -> void:
	OnRerollClicked.emit()
