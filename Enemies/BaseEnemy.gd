class_name BaseEnemy
extends CharacterBody2D


@export var target: Node2D
@export var _decay: float = 1.5
@export var Data: EnemyResource
@export var _pushTransfer: float = 0.8   # <1 so the chain fades out
@export var _minPushSpeed: float = 10.0
#The brain of the AI, only movement related
var Brain:FSM

var _isPushingEnemy: bool = false
var _externalVelocity: Vector2 = Vector2.ZERO
var _internalVelocity: Vector2 = Vector2.ZERO

func _ready() -> void:
	if(Data == null):
		printerr("No data found")
	Brain = get_node("Brain")
	if(Brain == null):
		printerr("NO BRAIN")

func Push(impulse: Vector2) -> void:
	if impulse.is_zero_approx(): return
	# Raise our velocity along the push direction up to the impulse,
	# but never stack on top of it (contact lasts many frames).
	var dir := impulse.normalized()
	var missing := impulse.length() - _externalVelocity.dot(dir)
	if missing > 0.0:
		_externalVelocity += dir * missing


func DecayExternalForce(delta: float) -> void:
	_externalVelocity = _externalVelocity.lerp(Vector2.ZERO, 1.0 - exp(-_decay * delta))
	if _externalVelocity.length() < 1.0:
		_externalVelocity = Vector2.ZERO

func LookAtPlayer():
	if(target == null): return
	rotation = (target.global_position - global_position).angle() + PI/2

func Move() -> void:
	var internal := _internalVelocity
	var pushLen := _externalVelocity.length()
	if pushLen > _minPushSpeed:
		var pushDir := _externalVelocity / pushLen
		var against := internal.dot(pushDir)
		if against < 0.0:
			internal -= pushDir * against   # drop the part that resists the shove
	velocity = _externalVelocity + internal
	move_and_slide()
	HandleEnemyPush()

func HandleEnemyPush() -> void:
	if _externalVelocity.length() < _minPushSpeed: return
	for i in get_slide_collision_count():
		var col := get_slide_collision(i)
		var other := col.get_collider() as BaseEnemy
		if other == null: continue
		var dir := -col.get_normal()                  # points from me into them
		var strength := _externalVelocity.dot(dir)    # how much of my push goes into them
		if strength <= 0.0: continue
		other.Push(dir * strength * _pushTransfer)


func _physics_process(delta: float) -> void:
	DecayExternalForce(delta)
	LookAtPlayer()

func OnReady() -> void:
	if(Brain != null):
		Brain.StartFSM()
