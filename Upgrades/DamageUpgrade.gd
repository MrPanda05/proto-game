class_name DamageUpgrade
extends BaseUpgrade

@export var value: float

func ApplyUpgradeStats(entity: Node2D):
	for child in entity.get_children():
		if is_instance_of(child, StatsComponent):
			print("More damage")
			child.damage += value
