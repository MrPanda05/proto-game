class_name HoverStateRIG
extends EnemyState

## Add variation between enemies
var _personalOffset: Vector2 = Vector2.ZERO

func Enter() -> void:
	_personalOffset = Vector2(
		## Fix this so that it has both horizontal and vertical spreed
		randf_range(-enemy.Data.spreadX * randf_range(1, 3.5), enemy.Data.spreadX) * randf_range(1, 3.5),
		randf_range(-enemy.Data.spreadY * randf_range(1, 3.5), enemy.Data.spreadY * randf_range(1, 3.5))
	)

func FixUpdate(delta: float) -> void:
	if not is_instance_valid(enemy.target):
		enemy.desiredVelocity = Vector2.ZERO
		return
	var anchor := Vector2(enemy.target.global_position.x, enemy.Data.desiredHeight) + _personalOffset
	SteerTo(anchor, delta)
