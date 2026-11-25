class_name NormalProjectile
extends BaseBullet

var _direction: Vector2

func OnContact(hurt: HurtboxComponent):
	if(!CanDoDamage(hurt)): return
	if(IsProjectile(hurt)):
		#_hitCount += 1
		#if(_hitCount >= maxHitCount):
			#queue_free()
		pass
	else:
		for i in hitData.Upgrades:
			i.AddComponent(hurt.get_parent())
		hurt.DoDamage(hitData)
		queue_free()

func Move(dir: Vector2):
	_direction = dir

#func CanDoDamage(hurt: HurtboxComponent) -> bool:
	##Check for self hit(bullet with itself)
	#if(hurt == hurtBox): return false
	##Check if hit its own, avoiding self hit(player getting hit by its own bullet)
	#var targetParent = hurt.get_parent()
	#if(targetParent == _mySource): return false
	## If identity of me is equal to identity of target, means its a projectile
	#if(hurt.OwnerIdentity.kind == myIdentity.kind):
		#var targetProjectile: BaseBullet = targetParent as BaseBullet
		#if(targetProjectile.sourceIdentity.kind == sourceIdentity.kind): return false
		#print("Hit a projectile that isn't mine")
		#return true
	#return true



func _physics_process(delta: float) -> void:
	if(GameManager.CurrentState == GameManager.States.PLAYING):
		velocity = _direction * speed
		$Icon.rotation_degrees += 270 * delta
		move_and_slide()


func OnTimerTimeout() -> void:
	queue_free()
