@abstract
class_name BaseUpgrade
extends Resource

## Ideia is that upgrades will get the entity, search for things or add stuff to it
@export var icon: Texture2D
@export var upgradeName: String
@export var upgradeDescription: String
## 0 - COMMON, 1 - UNCOMMON, 2 - EPIC
@export var rarity: int
@abstract
func ApplyUpgradeStats(entity: Node2D)
