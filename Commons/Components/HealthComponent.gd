class_name  HealthComponent
extends Node2D

@export var maxHealth: float
@export var currentHealth: float

signal OnDeath
signal OnHealthChanged
signal OnMaxHealthChanged

func SetUp(newMaxHealth: float, recoverHealth: bool = false) -> void:
	maxHealth = newMaxHealth
	OnMaxHealthChanged.emit()
	if(recoverHealth):
		currentHealth = maxHealth
		OnHealthChanged.emit()


func TakeDamage(damage: float) -> void:
	currentHealth -= damage
	if(currentHealth <= 0):
		OnDeath.emit()
	OnHealthChanged.emit()
