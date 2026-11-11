## Who takes damage
class_name HurtboxComponent
extends Area2D

@export var _hasImunityFrames: bool = false
@export var _maxImunityFrames: int = 5

var _imunityFramesCount: int = 0
var IsOnIframes: bool = false

signal OnIframesStarted
signal OnIframesEnded
signal OnHit(hitdata: HitInfo)

## Set up of the hurtbox
## (1 << 0) | (1 << 2)
func SetUp(layer: int, mask: int, hasIFrames: bool, maxIFrames: int):
	collision_layer = layer
	collision_mask = mask
	_hasImunityFrames = hasIFrames
	_maxImunityFrames = maxIFrames

func DoDamage(hitData: HitInfo, ignoreIFrames: bool = false) -> bool:
	if(IsOnIframes && !ignoreIFrames):
		return false
	OnHit.emit(hitData)
	if(_hasImunityFrames):
		IsOnIframes = true
		_imunityFramesCount = 0
		set_physics_process(true)
		OnIframesStarted.emit()
	return true

func _ready() -> void:
	set_physics_process(false)

func _physics_process(_delta: float) -> void:
	_imunityFramesCount += 1
	if (_imunityFramesCount >= _maxImunityFrames):
		IsOnIframes = false
		set_physics_process(false)
		OnIframesEnded.emit()
