class_name PlayerStatsComponent
extends StatsComponent

var critChance: float = 0
var superCritChance: float = 0
var critDamageMultiplier: float = 0
var superCritDamageMultiplier: float = 0
var jumpHeight: float = 0
var variableJumpHeight: float = 0
var maxJumps: int = 0
var jumpToPeak: float = 0
var jumpTimeToGround: float = 0


func _ApplyStats(stats: BaseStats) -> void:
	super(stats)
	var playerStats := stats as PlayerStats
	if playerStats == null: return
	critChance = playerStats.critChance
	superCritChance = playerStats.superCritChance
	critDamageMultiplier = playerStats.critDamageMultiplier
	superCritDamageMultiplier = playerStats.superCritDamageMultiplier
	jumpHeight = playerStats.jumpHeight
	variableJumpHeight = playerStats.variableJumpHeight
	maxJumps = playerStats.maxJumps
	jumpToPeak = playerStats.jumpToPeak
	jumpTimeToGround = playerStats.jumpTimeToGround


# --- Setters (emit the base class signal onChanged) ---

func SetCritChance(value: float) -> void:
	critChance = value
	onChanged.emit()


func SetSuperCritChance(value: float) -> void:
	superCritChance = value
	onChanged.emit()


func SetCritDamageMultiplier(value: float) -> void:
	critDamageMultiplier = value
	onChanged.emit()


func SetSuperCritDamageMultiplier(value: float) -> void:
	superCritDamageMultiplier = value
	onChanged.emit()


func SetJumpHeight(value: float) -> void:
	jumpHeight = value
	onChanged.emit()


func SetVariableJumpHeight(value: float) -> void:
	variableJumpHeight = value
	onChanged.emit()


func SetMaxJumps(value: int) -> void:
	maxJumps = value
	onChanged.emit()


func SetJumpToPeak(value: float) -> void:
	jumpToPeak = value
	onChanged.emit()


func SetJumpTimeToGround(value: float) -> void:
	jumpTimeToGround = value
	onChanged.emit()
