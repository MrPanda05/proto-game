class_name BaseEnemyBody
extends RigidBody2D

@export var Data: EnemyResource
@export var target: Node2D


var desiredVelocity: Vector2 = Vector2.ZERO
var desiredGlobalPos: Vector2 = Vector2.ZERO
var Brain: FSM
var _angle: float = 0.0
@onready var _hurtBox: HurtboxComponent = $HurtboxComponent
@onready var _hitBox: HitboxComponent = $HitboxComponent
@onready var _healthComponent: HealthComponent = $HealthComponent
@onready var _visual: Sprite2D = $Sprite2D

signal OnDeath

## On Took damage
func OnTookDamage(hitInfo: HitInfo):
	print(hitInfo.damage)
	_healthComponent.TakeDamage(hitInfo.damage)

## On contact damage with player
func OnHit(hitBox: HitboxComponent):
	print("Ninja")
	pass

## HealthChanged
func OnHealthChanged():
	var fade: float = clampf(
		_healthComponent.currentHealth / _healthComponent.maxHealth,
		0.0,
		1.0
	)
	if(fade <= .35): return
	_visual.modulate.a = fade

## On enemy death
func OnDied():
	OnDeath.emit()
	queue_free()
	print("Died")

func _ready() -> void:
	gravity_scale = 0.0
	lock_rotation = true
	can_sleep = false
	linear_damp = 4.0
	_angle = rotation
	if Data == null:
		printerr("No data found")
	Brain = get_node_or_null("Brain")
	if Brain == null:
		printerr("NO BRAIN")

func _physics_process(_delta: float) -> void:
	queue_redraw()
	print(desiredGlobalPos)
	apply_central_force((desiredVelocity - linear_velocity) * Data.steerStrength * mass)


func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	if target != null:
		var wanted := (target.global_position - state.transform.origin).angle() + PI / 2
		_angle = lerp_angle(_angle, wanted, clampf(Data.turnSpeed * state.step, 0.0, 1.0))
	state.transform = Transform2D(_angle, state.transform.origin)

func OnStart() -> void:
	if Brain != null:
		Brain.StartFSM()
	_hurtBox.connect("OnHit", OnHit)
	_hitBox.connect("OnHit", OnTookDamage)
	_healthComponent.connect("OnHealthChanged", OnHealthChanged)
	_healthComponent.connect("OnDeath", OnDied)
	_healthComponent.SetUp(30)
