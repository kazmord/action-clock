class_name Enemy extends CharacterBody2D

const SPEED = 50.0


func _physics_process(delta: float) -> void:

	move_and_slide()
