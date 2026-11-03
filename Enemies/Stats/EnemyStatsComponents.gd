class_name EnemyStatsComponents
extends StatsComponent

var sprite: Texture2D = null
var hoverOffset: Vector2 = Vector2(0, -200)
var desiredHeight: float = 300
var spread: float = 40.0
var slow_radius: float = 80.0
var stop_radius: float = 6.0
var acceleration: float = 400.0
var steerStrength: float = 4.0
var turnSpeed: float = 12.0


func _ApplyStats(stats: BaseStats) -> void:
	super(stats)
	var enemyStats := stats as EnemyStats
	if enemyStats == null: return
	sprite = enemyStats.sprite
	hoverOffset = enemyStats.hoverOffset
	desiredHeight = enemyStats.desiredHeight
	spread = enemyStats.spread
	slow_radius = enemyStats.slow_radius
	stop_radius = enemyStats.stop_radius
	acceleration = enemyStats.acceleration
	steerStrength = enemyStats.steerStrength
	turnSpeed = enemyStats.turnSpeed


# --- Setters (emit the base class signal onChanged) ---

func SetSprite(value: Texture2D) -> void:
	sprite = value
	onChanged.emit()


func SetHoverOffset(value: Vector2) -> void:
	hoverOffset = value
	onChanged.emit()


func SetDesiredHeight(value: float) -> void:
	desiredHeight = value
	onChanged.emit()


func SetSpread(value: float) -> void:
	spread = value
	onChanged.emit()


func SetSlowRadius(value: float) -> void:
	slow_radius = value
	onChanged.emit()


func SetStopRadius(value: float) -> void:
	stop_radius = value
	onChanged.emit()


func SetAcceleration(value: float) -> void:
	acceleration = value
	onChanged.emit()


func SetSteerStrength(value: float) -> void:
	steerStrength = value
	onChanged.emit()


func SetTurnSpeed(value: float) -> void:
	turnSpeed = value
	onChanged.emit()
