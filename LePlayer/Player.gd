class_name Player
extends CharacterBody2D

@export var speed: float = 250
## Default gravity when falling platform
@export var defaultGravity: float = 1500
## The max height of the jump
@export var jumpHeight: float = 150
## The time to reach the top height of the jump
@export var jumpTimeToPeak: float = 0.25
## The time to reach the ground
@export var jumpTimeToDescent: float = 0.2
@export var variableJumpHeight: float = 75
@export var maxJumps: int = 1
@export var pushForce: float = 10


@onready var _jumpVel: float = ((2.0 * jumpHeight) / jumpTimeToPeak) * -1
@onready var _jumpGravity: float = ((-2.0 * jumpHeight) / (jumpTimeToPeak * jumpTimeToPeak)) * -1
@onready var _fallGravity: float = ((-2.0 * jumpHeight) / (jumpTimeToDescent * jumpTimeToDescent)) * -1
@onready var _variableJumpGravity: float = (_jumpVel * _jumpVel) / (2 * variableJumpHeight)
var _horizontalInput: float = 0
var _jumpInput: bool = false
var _holdJumpInput: bool = false
var _hasJumped: bool = false
var _jumpCount: int = 0
var _isOnOneWay:bool = false
var _hasPressedDown: bool = false
var _isPushingEnemy: bool = false

const ONE_WAY_LAYER := 6

func GarderInputs() -> void:
	_horizontalInput = Input.get_axis("Left", "Right")
	_jumpInput = Input.is_action_just_pressed("Jump")
	_holdJumpInput = Input.is_action_pressed("Jump")
	_hasPressedDown =Input.is_action_pressed("Down")

func Jump() -> void:
	if(_jumpCount >= maxJumps): return
	velocity.y = _jumpVel
	_hasJumped = true
	_jumpCount += 1
	_jumpInput = false

func GetGravity() -> float:
	if(velocity.y < 0):
		if(!_holdJumpInput):
			return _variableJumpGravity
		return _jumpGravity
	else:
		return _fallGravity

func DetectOneWays() -> bool:
	for i in get_slide_collision_count():
		var col := get_slide_collision(i)
		var collider := col.get_collider()
		if collider is StaticBody2D and collider.is_in_group("OneWays"):
			return true
	return false

#func HandleEnemyPush() -> void:
	#_isPushingEnemy = false
	#for i in get_slide_collision_count():
		#var col := get_slide_collision(i)
		#var enemy := col.get_collider() as BaseEnemy
		#if enemy == null:
			#continue
		#var dir := -col.get_normal()
		#enemy.Push(dir.normalized() * pushForce)
		#if absf(dir.x) > 0.5 and signf(dir.x) == signf(_horizontalInput):
			#_isPushingEnemy = true
func HandleEnemyPush(intended: Vector2) -> void:
	_isPushingEnemy = false
	for i in get_slide_collision_count():
		var col := get_slide_collision(i)
		var enemy := col.get_collider() as BaseEnemy
		if enemy == null:
			continue
		var dir := -col.get_normal()
		var pushSpeed := intended.dot(dir)   # how fast I'm trying to walk into it
		if pushSpeed <= 0.0:
			continue
		enemy.Push(dir * pushSpeed * pushForce)   # pushForce is now a multiplier, ~1.0
		if absf(dir.x) > 0.5 and signf(dir.x) == signf(_horizontalInput):
			_isPushingEnemy = true


func HandleOneWays() -> void:
	set_collision_mask_value(ONE_WAY_LAYER, !_hasPressedDown)


func _physics_process(delta: float) -> void:
	GarderInputs()
	if(is_on_floor()):
		_hasJumped = false
		_jumpCount = 0
		velocity.y = 2
	if(!is_on_floor()):
		velocity.y += GetGravity() * delta
	if(_jumpInput):
		Jump()
	HandleOneWays()
	var intended := velocity
	velocity.x = _horizontalInput * speed * (0.5 if _isPushingEnemy else 1.0)
	move_and_slide()
	HandleEnemyPush(intended)
	_isOnOneWay = DetectOneWays()
	
