class_name PlayerRig
extends RigidBody2D

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

@onready var _jumpVel: float = ((2.0 * jumpHeight) / jumpTimeToPeak) * -1
@onready var _jumpGravity: float = ((-2.0 * jumpHeight) / (jumpTimeToPeak * jumpTimeToPeak)) * -1
@onready var _fallGravity: float = ((-2.0 * jumpHeight) / (jumpTimeToDescent * jumpTimeToDescent)) * -1
@onready var _variableJumpGravity: float = (_jumpVel * _jumpVel) / (2 * variableJumpHeight)

var _horizontalInput: float = 0
var _jumpInput: bool = false
var _holdJumpInput: bool = false
var _hasJumped: bool = false
var _jumpCount: int = 0
var _isOnFloor: bool = false
var _isOnOneWay: bool = false
var _hasPressedDown: bool = false

const ONE_WAY_LAYER := 6
const FLOOR_DOT := 0.7   # how upward a contact normal must be to count as floor


func _ready() -> void:
	gravity_scale = 0.0                       # we apply our own gravity
	lock_rotation = true                      # player must not tumble
	can_sleep = false
	linear_damp_mode = RigidBody2D.DAMP_MODE_REPLACE
	linear_damp = 0.0                         # no drag, we control velocity directly
	contact_monitor = true                    # needed to read contacts (floor detection)
	max_contacts_reported = 8


func GarderInputs() -> void:
	_horizontalInput = Input.get_axis("Left", "Right")
	if Input.is_action_just_pressed("Jump"):
		_jumpInput = true
	_holdJumpInput = Input.is_action_pressed("Jump")
	_hasPressedDown = Input.is_action_pressed("Down")


func GetGravity(vy: float) -> float:
	if vy < 0:
		if !_holdJumpInput:
			return _variableJumpGravity
		return _jumpGravity
	return _fallGravity

# Todo fix this for rigidbody
func HandleOneWays() -> void:
	set_collision_mask_value(ONE_WAY_LAYER, !_hasPressedDown)


func _physics_process(_delta: float) -> void:
	GarderInputs()
	HandleOneWays()


func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	var vel := state.linear_velocity

	# Floor and one-way detection from this step's contacts
	_isOnFloor = false
	_isOnOneWay = false
	for i in state.get_contact_count():
		if state.get_contact_local_normal(i).dot(Vector2.UP) > FLOOR_DOT:
			_isOnFloor = true
			var collider := state.get_contact_collider_object(i)
			if collider is StaticBody2D and collider.is_in_group("OneWays"):
				_isOnOneWay = true

	# Landing resets (vel.y >= 0 so we don't reset on the frame we leave the ground)
	if _isOnFloor and vel.y >= 0.0:
		_hasJumped = false
		_jumpCount = 0

	# Gravity
	vel.y += GetGravity(vel.y) * state.step

	# Jump
	if _jumpInput:
		if _jumpCount < maxJumps:
			vel.y = _jumpVel
			_hasJumped = true
			_jumpCount += 1
		_jumpInput = false

	# Horizontal movement
	vel.x = _horizontalInput * speed

	state.linear_velocity = vel
