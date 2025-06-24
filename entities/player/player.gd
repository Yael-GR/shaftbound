extends CharacterBody2D

@export var health_component: HealthComponent
@export var speed = 150

# Movement direction based on user input
@onready var axis = Vector2.ZERO

func _physics_process(delta: float) -> void:
	move_and_slide()

func get_health_component() -> HealthComponent:
	return health_component

func _on_health_component_target_is_dead() -> void:
	get_tree().reload_current_scene()
	
