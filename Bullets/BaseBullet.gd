@abstract
class_name BaseBullet
extends CharacterBody2D

@export var size: float = 1
@export var speed: float = 150
@export var baseDamage: float = 5
@export var maxHitCount: int = 1
var _hitCount: int = 0

@onready var _hurtbox: HurtboxComponent = $HurtboxComponent

@abstract
func OnHit(hitBox: HitboxComponent)

@abstract
func Move(dir: Vector2)

func SetUp(damage: float, mask: int):
	baseDamage = damage
	_hurtbox.set_collision_mask_value(mask, true)
	
