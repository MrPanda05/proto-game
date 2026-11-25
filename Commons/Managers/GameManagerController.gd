class_name GameManagerController
extends Node

enum States { MENU, PLAYING, PAUSED, UPGRADE, GAMEOVER }

signal OnStateChanged

@export var GameEventBus: GameplayBus
@export var CurrentState: States

@onready var UpgradeHolder: PlayerUpgrades = $PlayerUpgrades

func ChangeState(newState: States):
	CurrentState = newState
	OnStateChanged.emit()

func RaiseUpgradeEvent(upgradedPicked: BaseUpgrade):
	GameEventBus.OnUpgradePicked.emit(upgradedPicked)
