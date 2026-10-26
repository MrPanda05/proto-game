@abstract
class_name EnemyState
extends State

var enemy: BaseEnemyBody

func Start() -> void:
	enemy = owner as BaseEnemyBody

## Changes the direction of the player towards the desired point
## [br]
## anchor is the desired global position to go
func SteerTo(anchor: Vector2, delta: float) -> void:
	## Direction towards the target position (final pos - initial pos)
	var to_anchor := anchor - enemy.global_position
	var dist := to_anchor.length()
	var desired := Vector2.ZERO
	## Shirnks the vector, slowing down if reaching the desired radius
	if dist > enemy.Data.stop_radius:
		var speed_scale := clampf(dist / enemy.Data.slow_radius, 0.0, 1.0)
		desired = to_anchor / dist * enemy.Data.speed * speed_scale
	DebugVectorDraw.DrawVector(enemy.global_position, desired, Color.AQUA)
	enemy.desiredVelocity = enemy.desiredVelocity.move_toward(desired, enemy.Data.acceleration * delta)
