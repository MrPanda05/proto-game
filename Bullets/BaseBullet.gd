@abstract
class_name BaseBullet
extends CharacterBody2D

@export var size: float = 1
@export var speed: float = 150
@export var baseDamage: float = 5
var maxHitCount: int = 1
var _hitCount: int = 0
var _mySource: Node

@onready var hitBox: HitboxComponent = $HitboxComponent
@onready var hurtBox: HurtboxComponent = $HurtboxComponent
@onready var myIdentity: IdentityComponent = $IdentityComponent
var sourceIdentity: IdentityComponent.Kind

func _ready() -> void:
	hitBox.OnAttackHit.connect(OnContact)


@abstract func OnContact(hurt: HurtboxComponent)


@abstract func Move(dir: Vector2)

func CanDoDamage(hurt: HurtboxComponent) -> bool:
	# Check if target is my parent
	if hurt.get_parent() == _mySource: return false
	return GetTeam(hurt) != sourceIdentity

func GetTeam(hurt: HurtboxComponent) -> IdentityComponent.Kind:
	var other := hurt.get_parent() as BaseBullet
	# If is projectile, return the identity of its parent
	if other != null: return other.sourceIdentity
	# Return the identity of hit target
	return hurt.OwnerIdentity.kind

## True if the hurtbox we touched belongs to another projectile
func IsProjectile(hurt: HurtboxComponent) -> bool:
	return hurt.OwnerIdentity != null and hurt.OwnerIdentity.kind == IdentityComponent.Kind.PROJECTILE

func SetUp(damage: float, mask: int, source: Node):
	baseDamage = damage
	hitBox.SetUp(mask)
	_mySource = source
	sourceIdentity = source.get_node("IdentityComponent").kind
	maxHitCount = 2 + floori(damage / 3)
