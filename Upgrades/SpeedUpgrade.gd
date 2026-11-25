class_name SpeedUpgrade
extends BaseUpgrade

@export var value: float

func AddComponent(entity: Node2D):
	pass

func ApplyUpgradeStats(entity: Node2D):
	for child in entity.get_children():
		var stats := child as StatsComponent
		if stats == null: continue
		stats.SetSpeedPercent(stats.speedPercent + value)
