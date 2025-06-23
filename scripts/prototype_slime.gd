extends CharacterBody2D

@onready var health_component: HealthComponent = $HealthComponent
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	health_component.target_is_dead.connect(play_death_animation)

func play_death_animation() -> void:
	animation_player.play("dead")
