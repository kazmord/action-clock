class_name DamageAreaComponent extends Area2D

@export var base_damage := 1
@export var hurts_player := false
@export var hurts_enemies := false
@export var destroyed_on_environment_collision := false
@export var ignore_enemy_groups := [] # to hurt enemies but not certain types, include group name here

func _on_body_entered(body: Node2D) -> void:
	print("body entered: " + str(body) + " at " + str(body.global_position))
	if body is Player and hurts_player:
		body.health_component.take_damage(base_damage)
	if body is Enemy and hurts_enemies:
		if !ignore_enemy_groups.any(func(group): body.is_in_group(group)):
			body.health_component.take_damage(base_damage)
	if destroyed_on_environment_collision:
		call_deferred("queue_free")
