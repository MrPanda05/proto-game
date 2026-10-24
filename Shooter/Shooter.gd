class_name Shooter
extends Node2D


@export var _wandVisual: Sprite2D
@export var _wandExitPoint: Node2D
@export var fireRate: float
@export var BulletScene: PackedScene
var _canShoot: bool = true
var _firerateTimer: Timer

func _ready() -> void:
	_firerateTimer = get_node("FirerateTimer")

func Shoot(direction: Vector2) -> void:
	if(!_canShoot):return
	if(BulletScene == null):
		printerr("Bulet instance is Null, fix it!")
		return
	var bulletInstance: BaseBullet = BulletScene.instantiate()
	bulletInstance.global_position = _wandExitPoint.global_position
	get_parent().get_parent().add_child(bulletInstance)
	bulletInstance.Move((direction - global_position).normalized())
	print("shoot")
	_firerateTimer.start()
	_canShoot = false

func SetUpShooter(firerate: float) -> void:
	fireRate = firerate

func MoveShoot(direction: Vector2):
	if(_wandVisual == null): return
	var angle = (direction - global_position).angle() + PI / 2
	_wandVisual.global_rotation = angle

func OnFirerateTimerTimeout() -> void:
	_canShoot = true
