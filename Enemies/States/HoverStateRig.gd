class_name HoverStateRIG
extends EnemyState

var _personalOffset: Vector2 = Vector2.ZERO

func Enter() -> void:
	_personalOffset = Vector2(
		randf_range(-enemy.Data.spread, enemy.Data.spread),
		randf_range(-enemy.Data.spread, enemy.Data.spread)
	)

func FixUpdate(delta: float) -> void:
	if not is_instance_valid(enemy.target):
		enemy.desiredVelocity = Vector2.ZERO
		return

	var anchor := enemy.target.global_position + enemy.Data.hoverOffset + _personalOffset
	var to_anchor := anchor - enemy.global_position
	var dist := to_anchor.length()

	var desired := Vector2.ZERO
	if dist > enemy.Data.stop_radius:
		# "arrive": full speed far away, slows down smoothly near the anchor
		var speed_scale := clampf(dist / enemy.Data.slow_radius, 0.0, 1.0)
		desired = to_anchor / dist * enemy.Data.speed * speed_scale

	# The state only decides WHERE the enemy wants to go.
	# The body turns that into a force, so pushes still work.
	enemy.desiredVelocity = enemy.desiredVelocity.move_toward(desired, enemy.Data.acceleration * delta)
