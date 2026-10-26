class_name HoverStateRIG
extends EnemyState

## Add variation between enemies
var _personalOffset: Vector2 = Vector2.ZERO

func Enter() -> void:
	_personalOffset = Vector2(
		## Fix this so that it has both horizontal and vertical spreed
		randf_range(-enemy.Data.spread, enemy.Data.spread),
		randf_range(-enemy.Data.spread, enemy.Data.spread)
	)

func FixUpdate(delta: float) -> void:
	if not is_instance_valid(enemy.target):
		enemy.desiredVelocity = Vector2.ZERO
		return
	var anchor := Vector2(enemy.target.global_position.x, enemy.Data.desiredHeight) + _personalOffset
	SteerTo(anchor, delta)
