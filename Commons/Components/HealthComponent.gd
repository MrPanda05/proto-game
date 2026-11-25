class_name  HealthComponent
extends Node2D

@export var maxHealth: float
@export var currentHealth: float
@export var isDead: bool

signal OnDeath
signal OnHealthChanged
signal OnMaxHealthChanged

func SetUp(newMaxHealth: float, recoverHealth: bool = false) -> void:
	isDead = false
	maxHealth = newMaxHealth
	OnMaxHealthChanged.emit()
	if(recoverHealth):
		currentHealth = maxHealth
		OnHealthChanged.emit()


func TakeDamage(damage: float) -> void:
	if(isDead): return
	currentHealth -= damage
	if(currentHealth <= 0):
		isDead = true
		OnDeath.emit()
	OnHealthChanged.emit()
