class_name BleedComponent
extends Node

var hurtBox:HurtboxComponent
var healthCompo:HealthComponent
@export var bleedDamage: float
var _canDoDamage: bool = false
@onready var TickTimer: Timer = $TickTime
@onready var StopTicking: Timer = $StopTicking

var _myUpgrade: BleedUpgrade

func _ready() -> void:
	var parent = get_parent()
	hurtBox = parent.get_node("HurtboxComponent")
	healthCompo = parent.get_node("HealthComponent")
	hurtBox.OnHit.connect(GotHit)

func GotHit(hit:HitInfo):
	_canDoDamage = true
	StopTicking.start()

func OnTimerTimeout() -> void:
	if(!_canDoDamage): return
	print("Bleed damage")
	healthCompo.TakeDamage(bleedDamage * GameManager.UpgradeHolder.GetStacks(_myUpgrade.id))
	TickTimer.start()


func OnStopTickingTimeout() -> void:
	_canDoDamage = false
