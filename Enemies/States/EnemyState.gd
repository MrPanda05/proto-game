@abstract
class_name EnemyState
extends State

var enemy: BaseEnemyBody

func Start() -> void:
	enemy = owner as BaseEnemyBody
