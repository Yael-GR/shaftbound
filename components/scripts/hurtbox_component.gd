class_name Hurtbox
extends Area2D

signal recieved_damage(damage: float)

func _ready() -> void:
	connect("area_entered", _on_area_entered)

func _on_area_entered(hitbox: Hitbox) -> void:
	if hitbox != null:
		print("i need to recieve damage")
		recieved_damage.emit(hitbox.damage)
