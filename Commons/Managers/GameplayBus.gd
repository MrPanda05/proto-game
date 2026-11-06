## Event bus for gameplay scene
class_name  GameplayBus
extends Node


signal OnGameStart
signal OnGameOver
signal OnWaveStarted(currentWave: int)
signal OnWaveEnded
signal OnUpgradePicked(upgrade: BaseUpgrade)
