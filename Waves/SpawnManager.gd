class_name SpawnManager
extends Node2D


@onready var _waveManager: WaveManager = $".."

@export var _testEnemy: PackedScene

@export var _spawnPoint: Node2D

var _currentMaxEnemies: int = 0
var _currentEnemies: int = 0

var target: PlayerRig

func _ready() -> void:
	target = get_tree().get_first_node_in_group("Player")
	_waveManager.connect("OnWaveStarted", Spawn)

func OnEnemyDeath():
	_currentEnemies -= 1
	if(_currentEnemies == 0):
		_waveManager.EndCurrentWave()
		print("Wave ended")

func Spawn(currentWave: int):
	print("Spawning enemies")
	_currentMaxEnemies = currentWave + 3
	for i in range(_currentMaxEnemies):
		var instance:BaseEnemyBody = _testEnemy.instantiate()
		instance.target = target
		instance.freeze = true
		instance.global_position = position
		instance.freeze = false
		_waveManager.get_parent().add_child(instance)
		_currentEnemies += 1
		instance.global_position = _spawnPoint.global_position
		instance.connect("OnDeath", OnEnemyDeath)
		instance._healthComponent.SetUp(instance._healthComponent.maxHealth * _waveManager.currentWave)
