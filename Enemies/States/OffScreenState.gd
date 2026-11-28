class_name OffScreenState
extends EnemyState


var targetHeight: float = 0

func Enter() -> void:
	targetHeight = randf_range(900,1080)


func FixUpdate(delta: float) -> void:
	if not is_instance_valid(enemy.target):
		enemy.desiredVelocity = Vector2.ZERO
		return
	enemy.desiredVelocity = Vector2.DOWN * enemy.Data.speed * 10
	var distance = enemy.global_position.distance_to(enemy.target.global_position)
	if(distance <= targetHeight):
		enemy.desiredVelocity = Vector2.ZERO
		fsm.transition_to_state("HoverStateRIG")
