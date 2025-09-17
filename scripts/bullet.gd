class_name Bullet extends DamageAreaComponent

@export var speed := 30.0

@onready var direction = Vector2(1,0).rotated(rotation)

func _physics_process(delta: float):
	position = position + direction * speed * delta
