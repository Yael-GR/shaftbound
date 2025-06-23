class_name HealthComponent
extends Node

signal target_is_dead

@export var max_health: float = 50
@export var hurtbox: Hurtbox

@onready var health: float = max_health

func _ready() -> void:
	hurtbox.connect("recieved_damage", applay_damage)

func set_max_health(value: float) -> void:
	if value <= 0:
		value = 1
		
	# Set health to be the same percent as before max_health change
	health = value if value <= health else (health / max_health) * value
	
	max_health = value

func applay_damage(damage: float) -> void:
	# health cannot be under 0 or over max_health
	health = clamp(health - damage, 0, max_health)
	if health <= 0:
		target_is_dead.emit()
	print("ouch")

# Debug function
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("hurt_sim"):
		applay_damage(5)
		print("ouch")
