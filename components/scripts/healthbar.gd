class_name Healthbar extends TextureProgressBar

@export var health_component: HealthComponent

func _ready() -> void:
	update_healthbar_capacity() # Sets max_value and value
	
	health_component.connect("health_changed", update_healthbar)
	health_component.connect("max_health_changed", update_healthbar_capacity)

func _process(delta: float) -> void:
	pass

func update_healthbar() -> void:
	value = health_component.health
	
	if value < max_value:
		self.show()
	else:
		self.hide()

func update_healthbar_capacity() -> void:
	max_value = health_component.max_health
	update_healthbar()
