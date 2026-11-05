## The stats of an enemy
class_name EnemyStats
extends BaseStats

@export var sprite: Texture = null:
	set(value):
		sprite = value
		emit_changed()
@export var hoverOffset: Vector2 = Vector2(0, -200):
	set(value):
		hoverOffset = value
		emit_changed()
@export var desiredHeight: float = 300:
	set(value):
		desiredHeight = value
		emit_changed()
@export var spreadX: float = 40.0:
	set(value):
		spreadX = value
		emit_changed()
@export var spreadY: float = 40.0:
	set(value):
		spreadY = value
		emit_changed()
@export var slow_radius: float = 80.0:
	set(value):
		slow_radius = value
		emit_changed()
@export var stop_radius: float = 6.0:
	set(value):
		stop_radius = value
		emit_changed()
@export var acceleration: float = 400.0:
	set(value):
		acceleration = value
		emit_changed()
@export var steerStrength: float = 4.0:
	set(value):
		steerStrength = value
		emit_changed()
@export var turnSpeed: float = 12.0:
	set(value):
		turnSpeed = value
		emit_changed()
