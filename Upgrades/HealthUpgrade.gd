class_name HealthUpgrade
extends BaseUpgrade

@export var value: float

func ApplyUpgradeStats(entity: Node2D):
	var newValue: float = 0;
	var statsComp: StatsComponent
	var healthComp: HealthComponent
	for child in entity.get_children():
		if is_instance_of(child, StatsComponent):
			statsComp = child
		if is_instance_of(child, HealthComponent):
				healthComp = child
	print("Damaged")
	print(statsComp.damage)
	print(statsComp.maxHealth)
	statsComp.maxHealth += value
	print(statsComp.maxHealth)
	healthComp.SetUp(statsComp.maxHealth, true)
