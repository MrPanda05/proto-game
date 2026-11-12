class_name GameManagerController
extends Node

enum States { MENU, PLAYING, PAUSED, UPGRADE, GAMEOVER }

signal OnStateChanged

var GameEventBus: GameplayBus
@export var _gamePlayBusScene: PackedScene
@export var CurrentState: States

func CreateGameBus():
	GameEventBus = _gamePlayBusScene.instantiate()
	add_child(GameEventBus)


func DestroyGameBus():
	GameEventBus.queue_free()

func ChangeState(newState: States):
	CurrentState = newState
	OnStateChanged.emit()
