class_name Healthbar extends TextureProgressBar

@export var health_component: HealthComponent

func _ready() -> void:
	max_value = health_component.max_health
	value = health_component.health

func _process(delta: float) -> void:
	update()

func update() -> void:
	#Change health
	if value != health_component.health:
		value = health_component.health
