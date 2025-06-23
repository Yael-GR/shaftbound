class_name Hitbox
extends Area2D

@export var damage: float = 1

func set_damage(value: float) -> void:
	if value > 0:
		damage = value
