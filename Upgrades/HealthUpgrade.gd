class_name HealthUpgrade
extends BaseUpgrade

@export var value: float

func AddComponent():
	pass

func ApplyUpgradeStats(entity: Node2D):
	var newValue: float = 0;
	var statsComp: StatsComponent
	var healthComp: HealthComponent
	for child in entity.get_children():
		if is_instance_of(child, StatsComponent):
			statsComp = child
		if is_instance_of(child, HealthComponent):
				healthComp = child
	statsComp.SetMaxHealth(statsComp.maxHealth + value)
	healthComp.SetUp(statsComp.maxHealth, true)
