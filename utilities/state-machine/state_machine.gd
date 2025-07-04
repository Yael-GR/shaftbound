class_name StateMachine
extends Node

@export var initial_state: State

var current_state: State
var states: Dictionary = {}

func _ready() -> void:
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.connect("state_transitioned", on_child_transitioned)
	
	# If we defined initial state, enter it
	if initial_state:
		initial_state.enter()
		current_state = initial_state

func _process(delta: float) -> void:
	if current_state:
		current_state.update(delta)

func _physics_process(delta: float) -> void:
	if current_state:
		current_state.physics_update(delta)

func on_child_transitioned(old_state: State, new_state_name: String) -> void:
	# Check if state that signaled is the active one
	if old_state != current_state:
		return
	
	var new_state: State = states.get(new_state_name.to_lower())
	if current_state:
		current_state.exit() # If there is a current state, exit
	
	new_state.enter()
	current_state = new_state
