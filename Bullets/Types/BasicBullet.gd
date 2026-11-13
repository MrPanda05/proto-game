class_name BasicBullet
extends BaseBullet

var _direction: Vector2

func OnDamageDone(hurt: HurtboxComponent):
	var data: HitInfo = HitInfo.new()
	data.damage = baseDamage
	if(data.Source != null):
		data.Source = _mySource
	else:
		data.Source = null
	data.Attacker = self
	hurt.DoDamage(data)

func Move(dir: Vector2):
	_direction = dir

func _physics_process(delta: float) -> void:
	if(GameManager.CurrentState == GameManager.States.PLAYING):
		velocity = _direction * speed
		$Icon.rotation_degrees += 270 * delta
		move_and_slide()


func OnTimerTimeout() -> void:
	queue_free()
