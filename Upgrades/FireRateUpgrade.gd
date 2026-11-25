class_name AtkSpeedUpgrade
extends BaseUpgrade

@export var value: float

func AddComponent():
	pass

func ApplyUpgradeStats(entity: Node2D):
	for child in entity.get_children():
		var stats := child as StatsComponent
		if stats == null: continue
		stats.SetFireRate(stats.fireRatePercent + value)
