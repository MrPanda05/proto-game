class_name PlayerStats
extends BaseStats

@export var critChance: float = 0:
	set(value):
		critChance = value
		emit_changed()
@export var superCritChance: float = 0:
	set(value):
		superCritChance = value
		emit_changed()
@export var critDamageMultiplier: float = 0:
	set(value):
		critDamageMultiplier = value
		emit_changed()
@export var superCritDamageMultiplier: float = 0:
	set(value):
		superCritDamageMultiplier = value
		emit_changed()
@export var jumpHeight: float = 0:
	set(value):
		jumpHeight = value
		emit_changed()
@export var variableJumpHeight: float = 0:
	set(value):
		variableJumpHeight = value
		emit_changed()
@export var maxJumps: int = 0:
	set(value):
		maxJumps = value
		emit_changed()
@export var jumpToPeak: float = 0:
	set(value):
		jumpToPeak = value
		emit_changed()
@export var jumpTimeToGround: float = 0:
	set(value):
		jumpTimeToGround = value
		emit_changed()
