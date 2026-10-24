class_name BasicBullet
extends BaseBullet

var _direction: Vector2

func OnHit():
	queue_free()

func Move(dir: Vector2):
	_direction = dir

func _physics_process(delta: float) -> void:
	velocity = _direction * speed
	move_and_slide()
