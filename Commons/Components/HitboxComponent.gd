## Who takes damage
class_name HitboxComponent
extends Area2D

@export var hasImunityFrames: bool = false
@export var imunityFrames: int = 15

var isInImunityFrames: bool = false
signal OnHit(hitInfo: HitInfo)

func CalculateDamage(hitInfo: HitInfo):
	if(!isInImunityFrames):
		OnHit.emit(hitInfo)
		return
