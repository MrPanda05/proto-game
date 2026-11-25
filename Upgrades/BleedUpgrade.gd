class_name BleedUpgrade
extends BaseUpgrade

@export var BleedNode: PackedScene


func ApplyUpgradeStats(entity: Node2D):
	pass

func AddComponent(entity: Node2D):
	var bleed = entity.get_node_or_null("BleedComponent")
	if(bleed == null):
		var instance:BleedComponent = BleedNode.instantiate()
		instance._myUpgrade = self
		entity.add_child(instance)
