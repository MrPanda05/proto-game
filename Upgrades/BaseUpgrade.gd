@abstract
class_name BaseUpgrade
extends Resource

## Ideia is that upgrades will get the entity, search for things or add stuff to it
@export var icon: Texture2D
@export var upgradeName: String
@export var upgradeDescription: String
## 0 - COMMON, 1 - UNCOMMON, 2 - EPIC
@export var rarity: int
@export var id: StringName

## Tries to modify the stats of the entity
@abstract func ApplyUpgradeStats(entity: Node2D)
## Tries to add a component to the entity
@abstract func AddComponent(entity: Node2D)

func GetStats(entity: Node) -> StatsComponent:
	for child in entity.get_children():
		if child is StatsComponent:
			return child as StatsComponent
	return null
