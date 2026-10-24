class_name BasicBullet
extends BaseBullet

var _direction: Vector2

func OnHit(hitBox: HitboxComponent):
	if(hitBox != null):
		var damageInfo: HitInfo = HitInfo.new()
		damageInfo.damage = baseDamage
		hitBox.CalculateDamage(damageInfo)
	queue_free()

func Move(dir: Vector2):
	_direction = dir

func _physics_process(delta: float) -> void:
	velocity = _direction * speed
	move_and_slide()

func _ready() -> void:
	_hurtbox.connect("OnHit", OnHit)
