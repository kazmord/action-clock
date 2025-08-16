class_name Enemy extends CharacterBody2D

const SPEED = 50.0

@export var target: Node2D
@onready var nav_2d: NavComponent = $Nav

var target_pos = position

func _ready() -> void:
	nav_2d.target = target
	nav_2d.nav_target_path.connect(_update_target_pos)
	nav_2d.make_path()

func _physics_process(_delta: float) -> void:
	var dir = target_pos
	velocity = dir * SPEED
	move_and_slide()

func _update_target_pos(new_target_pos: Vector2) -> void:
	target_pos = new_target_pos
