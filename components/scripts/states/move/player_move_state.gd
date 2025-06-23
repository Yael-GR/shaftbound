class_name PlayerMoveState
extends State

@export var speed = 150
@export var body = CharacterBody2D

@onready var axis = Vector2.ZERO

func get_input_axis() -> Vector2:
	# Calculate the direction the player wants to move in
	# Horizontal: right = +1, left = -1
	axis.x = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	# Vertical: down = +1, up = -1
	axis.y = int(Input.is_action_pressed("move_down")) - int(Input.is_action_pressed("move_up"))
	return axis

func _physics_process(delta: float) -> void:
	# Get the current input direction
	axis = get_input_axis()
	# Set the velocity based on direction and speed
	body.velocity = axis * speed
