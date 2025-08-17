class_name Player extends CharacterBody2D

@onready var health_component: HealthComponent = $HealthComponent

const SPEED = 200.0

func _ready() -> void:
	health_component.hp_depleted.connect(die)

func _physics_process(delta: float) -> void:

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if direction:
		velocity = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()

func die() -> void:
	print('aaaa') #TODO: proper death handling
