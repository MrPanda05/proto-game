class_name EnemyResource
extends Resource


@export var sprite: Texture
@export var hoverOffset := Vector2(0, -200) 
@export var speed: float
@export var maxHealth: float
@export var contactDamage: float
@export var fireRate: float
@export var desiredHeight: float
@export var spread : float = 40.0                     
@export var slow_radius : float = 80.0                
@export var stop_radius : float = 6.0                 
@export var acceleration : float = 400.0
@export var steerStrength: float = 4.0
@export var turnSpeed: float = 12.0

func _init(
	p_speed = 30,
	p_maxHealth = 10,
	p_contactDamage = 1,
	p_fireRate = 0.1,
	p_sprite = null,
	p_desiredHeight = 10,
	p_hover_offset = Vector2(0, -200),
	p_spread = 40.0,
	p_slow_radius = 80.0,
	p_stop_radius = 6.0,
	p_acceleration = 400.0,
	p_steerStrength = 4.0,
	p_turnSpeed = 12.0
) -> void:
	speed = p_speed
	maxHealth = p_maxHealth
	contactDamage = p_contactDamage
	fireRate = p_fireRate
	sprite = p_sprite
	desiredHeight = p_desiredHeight
	hoverOffset = p_hover_offset
	spread = p_spread
	slow_radius = p_slow_radius
	stop_radius = p_stop_radius
	acceleration = p_acceleration
	steerStrength = p_steerStrength
	turnSpeed = p_turnSpeed
