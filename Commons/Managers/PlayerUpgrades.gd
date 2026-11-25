class_name PlayerUpgrades
extends Node


@export
var _stacks: Dictionary[StringName, int] = {}

func _ready() -> void:
	GameManager.GameEventBus.OnUpgradePicked.connect(Add)

func Add(upgrade: BaseUpgrade) -> void:
	_stacks[upgrade.id] = GetStacks(upgrade.id) + 1

func GetStacks(id: StringName) -> int:
	return _stacks.get(id, 0)

func Clear() -> void:
	_stacks.clear()
