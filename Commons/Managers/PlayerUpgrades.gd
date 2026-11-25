class_name PlayerUpgrades
extends Node


@export
var _stacks: Dictionary[StringName, int] = {}

@export
var Upgrades: Array[BaseUpgrade]

func _ready() -> void:
	GameManager.GameEventBus.OnUpgradePicked.connect(Add)

func Add(upgrade: BaseUpgrade) -> void:
	if(!Upgrades.has(upgrade)):
		Upgrades.append(upgrade)
	_stacks[upgrade.id] = GetStacks(upgrade.id) + 1

func GetStacks(id: StringName) -> int:
	return _stacks.get(id, 0)

func Clear() -> void:
	_stacks.clear()
	Upgrades.clear()
