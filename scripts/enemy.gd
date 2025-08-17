class_name Enemy extends CharacterBody2D

@export var speed := 50.0
@export var target: Node2D
@export var nav_2d: NavComponent
@export var health_component: HealthComponent

var target_pos = position

func _init() -> void:
	add_to_group("enemies")

func _ready() -> void:
	health_component.hp_depleted.connect(die)
	nav_2d.target = target
	nav_2d.nav_target_path.connect(_update_target_pos)
	nav_2d.make_path()

# simply follow player
func _physics_process(_delta: float) -> void:
	var dir = target_pos
	velocity = dir * speed
	move_and_slide()

func die() -> void:
	call_deferred("queue_free")

func _update_target_pos(new_target_pos: Vector2) -> void:
	target_pos = new_target_pos
