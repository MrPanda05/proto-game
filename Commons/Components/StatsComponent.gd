## Component that holds a stats, to be modified by an instance, thus not sharing
class_name StatsComponent
extends Node

## The ONLY change signal. Child classes emit this same signal through their setters.
signal onChanged

@export var referenceStats: BaseStats

var speed: float = 0
var speedPercent: float = 0
var maxHealth: float = 0
var contactDamage: float = 0
var damage: float = 0
var fireRate: float = 0
var fireRatePercent: float = 0
var defense: float = 0


func _enter_tree() -> void:
	if referenceStats == null: return
	ManualSetUp(referenceStats)


func _exit_tree() -> void:
	_DisconnectReference()


## Links the component to a resource, copies its values and keeps listening to it.
func ManualSetUp(stats: BaseStats) -> void:
	if referenceStats != stats:
		_DisconnectReference()
	referenceStats = stats
	if stats == null: return
	if not stats.changed.is_connected(_OnReferenceChanged):
		stats.changed.connect(_OnReferenceChanged)
	_ApplyStats(stats)
	onChanged.emit()


## Copies values from the resource WITHOUT emitting. Child classes override and call super.
func _ApplyStats(stats: BaseStats) -> void:
	speed = stats.speed
	speedPercent = stats.speedPercent
	maxHealth = stats.maxHealth
	contactDamage = stats.contactDamage
	damage = stats.damage
	fireRate = stats.fireRate
	fireRatePercent = stats.fireRatePercent
	defense = stats.defense


## The resource changed, so refresh this component's values.
func _OnReferenceChanged() -> void:
	if referenceStats == null: return
	_ApplyStats(referenceStats)
	onChanged.emit()


func _DisconnectReference() -> void:
	if referenceStats != null and referenceStats.changed.is_connected(_OnReferenceChanged):
		referenceStats.changed.disconnect(_OnReferenceChanged)


# --- Setters (modify only this instance, never the shared resource) ---

func SetSpeed(value: float) -> void:
	speed = value
	onChanged.emit()

func SetSpeedPercent(value: float) -> void:
	speedPercent = value
	onChanged.emit()

func SetMaxHealth(value: float) -> void:
	maxHealth = value
	onChanged.emit()


func SetContactDamage(value: float) -> void:
	contactDamage = value
	onChanged.emit()


func SetDamage(value: float) -> void:
	damage = value
	onChanged.emit()


func SetFireRate(value: float) -> void:
	fireRate = value
	onChanged.emit()

func SetFireRatePercent(value: float) -> void:
	fireRatePercent = value
	onChanged.emit()	

func SetDefense(value: float) -> void:
	defense = value
	onChanged.emit()
