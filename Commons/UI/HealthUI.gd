class_name HealthUI
extends Control


@export var _healthSlider: HSlider
@export var _healthValues: Label

@export var _healthComponent: HealthComponent


func _ready() -> void:
	_healthComponent.OnHealthChanged.connect(UpdateHealth)
	_healthComponent.OnMaxHealthChanged.connect(UpdateHealth)
	get_parent().get_parent().ready.connect(UpdateHealth)

func UpdateHealth():
	if(_healthSlider != null):
		_healthSlider.max_value = _healthComponent.maxHealth
		_healthSlider.value = _healthComponent.currentHealth
	if(_healthValues != null):
		_healthValues.text = "%d/%d" % [int(_healthComponent.currentHealth),int(_healthComponent.maxHealth)]


func _process(delta: float) -> void:
	UpdateHealth()
