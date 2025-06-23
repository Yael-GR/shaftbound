extends CharacterBody2D

@export var health_component: HealthComponent
@export var speed = 150

# Movement direction based on user input
@onready var axis = Vector2.ZERO

func _physics_process(delta: float) -> void:
	# Called every physics frame; handles movement logic
	move()

func get_input_axis() -> Vector2:
	# Calculate the direction the player wants to move in
	# Horizontal: right = +1, left = -1
	axis.x = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	# Vertical: down = +1, up = -1
	axis.y = int(Input.is_action_pressed("move_down")) - int(Input.is_action_pressed("move_up"))
	return axis

func move():
	# Get the current input direction
	axis = get_input_axis()
	# Set the velocity based on direction and speed
	velocity = axis * speed
	
	# Move the character and handle collision response
	move_and_slide()

func get_health_component() -> HealthComponent:
	return health_component
