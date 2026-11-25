## What does damage, if hitbox encouters hurtbox == damage
class_name HitboxComponent
extends Area2D

signal OnAttackHit(hurtbox: HurtboxComponent)

## Set up of the hitbox to see what it will detect
## (1 << 0) | (1 << 2)
func SetUp(mask: int):
	collision_layer = 0
	collision_mask = mask


## Work flow of hitbox and hurtbox relation
## 1 - Hitbox detects a hurtbox
## 2 - emits a signal
## 3 - The responsible for this hitbox, needs to listen to this signal and react with a method
## 4 - The react method can be simple or complex, such as just calling hurtbox.hurt() or just checking for other things
## 5 - Calling the hurtbox method, will make now the hurtbox process, if the damaged is sucessfull, it will emit a signal
## 6 - Then the one responsible for the hurt box will listen and react
func OnAreaEntered(area: Area2D) -> void:
	if(area is HurtboxComponent):
		if(area.get_parent() == get_parent()): return
		var hurt: HurtboxComponent = area
		OnAttackHit.emit(hurt)
