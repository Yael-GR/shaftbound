class_name Enemy
extends CharacterBody2D

@export var health_component: HealthComponent
@export var animation_player: AnimationPlayer

func _ready() -> void:
	health_component.target_is_dead.connect(play_death_animation)

func play_death_animation() -> void:
	animation_player.play("dead")
