class_name SpawnManager
extends Node2D


@onready var _waveManager: WaveManager = $".."

@export var _testEnemy: PackedScene

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
		print(i)
		var instance:BaseEnemyBody = _testEnemy.instantiate()
		instance.target = target
		instance.freeze = true
		instance.global_position = position
		instance.freeze = false
		add_child(instance)
		_currentEnemies += 1
		instance.connect("OnDeath", OnEnemyDeath)
