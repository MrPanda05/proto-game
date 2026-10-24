## Who does damage
class_name HurtboxComponent
extends Area2D
## Emitted once the hitsomething
signal OnHit(Hitbox: HitboxComponent)

func OnAreaEntered(area: Area2D) -> void:
	if(area is HitboxComponent):
		OnHit.emit(area)


func OnBodyEntered(_body: Node2D) -> void:
	OnHit.emit(null)
