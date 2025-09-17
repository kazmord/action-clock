class_name Player extends CharacterBody2D

signal shoot_projectile(p: Node2D)

@export var world: World

@onready var health_component: HealthComponent = $HealthComponent
@onready var shot_action_component: ShotActionComponent = $ShotActionComponent
@onready var aiming_reticle: Sprite2D = $AimingReticle

const SPEED = 200.0

func _ready() -> void:
	ClkMsg.player_action.connect(do_action)
	health_component.hp_depleted.connect(die)
	shot_action_component.shoot_projectile.connect(shoot)

func _physics_process(delta: float) -> void:

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if direction:
		velocity = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
	aiming_reticle.look_at(get_global_mouse_position())

	move_and_slide()

func die() -> void:
	print('aaaa') #TODO: proper death handling

func shoot(p: Node2D) -> void:
	shoot_projectile.emit(p)

func shot_action(p: PackedScene, pos: Vector2, angle: float) -> void:
	shot_action_component.shoot(p, pos, angle)

func do_action(act: ClkMsg.Actions):
	match(act):
		ClkMsg.Actions.SHOT:
			shot_action(load("res://scenes/projectiles/bullet.tscn"), aiming_reticle.global_position, aiming_reticle.global_rotation)
