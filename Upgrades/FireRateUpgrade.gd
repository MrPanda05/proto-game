class_name AtkSpeedUpgrade
extends BaseUpgrade

@export var value: float

func ApplyUpgradeStats(entity: Node2D):
	for child in entity.get_children():
		if is_instance_of(child, StatsComponent):
			print("Increase fire rate")
			child.fireRatePercent += value
