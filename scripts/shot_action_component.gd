class_name ShotActionComponent extends Node

@export var parent: Node2D

signal shoot_projectile(p: Node2D)

func shoot(proj: PackedScene, pos: Vector2, ang: float) -> void:
	var p = proj.instantiate()
	p.global_position = pos
	p.rotation = ang
	print("shot action component")
	shoot_projectile.emit(p)
