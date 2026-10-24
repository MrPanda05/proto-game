class_name  HealthComponent
extends Node2D

@export var maxHealth: float
@export var currentHealth: float

signal OnDeath
signal OnHealthChanged

func SetUp(newMaxHealth: float) -> void:
	maxHealth = newMaxHealth
	currentHealth = maxHealth


func TakeDamage(damage: float) -> void:
	currentHealth -= damage
	if(currentHealth <= 0):
		OnDeath.emit()
	OnHealthChanged.emit()
