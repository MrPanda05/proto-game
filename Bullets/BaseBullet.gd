@abstract
class_name BaseBullet
extends CharacterBody2D

@export var size: float = 1
@export var speed: float = 150
@export var maxHitCount: int = 1
var _hitCount: int = 0

@abstract
func OnHit()

@abstract
func Move(dir: Vector2)
