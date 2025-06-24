class_name HealthComponent
extends Node

signal target_is_dead
signal health_changed()
signal max_health_changed()

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
	
	max_health_changed.emit()
	health_changed.emit()

func set_health(value: float) -> void:
	# health cannot be under 0 or over max_health
	health = clamp(value, 0, max_health)
	health_changed.emit()

func applay_damage(damage: float) -> void:
	set_health(health - damage)
	
	if health <= 0:
		target_is_dead.emit()

# Debug function
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("hurt_sim"):
		applay_damage(5)
