## Generic entity stats
class_name BaseStats
extends Resource

@export var speed: float = 0:
	set(value):
		speed = value
		emit_changed()
@export var speedPercent: float = 0:
	set(value):
		speedPercent = value
		emit_changed()
@export var maxHealth: float = 0:
	set(value):
		maxHealth = value
		emit_changed()
@export var contactDamage: float = 0:
	set(value):
		contactDamage = value
		emit_changed()
@export var damage: float = 0:
	set(value):
		damage = value
		emit_changed()
@export var fireRate: float = 0:
	set(value):
		fireRate = value
		emit_changed()
@export  var fireRatePercent: float = 0:
	set(value):
		fireRatePercent = value
		emit_changed()
@export var defense: float = 0:
	set(value):
		defense = value
		emit_changed()
