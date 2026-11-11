@abstract
class_name BaseBullet
extends CharacterBody2D

@export var size: float = 1
@export var speed: float = 150
@export var baseDamage: float = 5
@export var maxHitCount: int = 1
var _hitCount: int = 0
var _mySource: Node

@onready var hitBox: HitboxComponent = $HitboxComponent

func _ready() -> void:
	hitBox.OnAttackHit.connect(OnDamageDone)

@abstract
func OnDamageDone(hurt: HurtboxComponent)

@abstract
func Move(dir: Vector2)

func SetUp(damage: float, mask: int, source: Node):
	baseDamage = damage
	hitBox.SetUp(0, mask)
	_mySource = source
