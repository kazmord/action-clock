class_name World extends Node2D

@export var player: Player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.shoot_projectile.connect(spawn_projectile)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func spawn_projectile(p: Node2D) -> void:
	add_child(p)

func _validate_necessary_nodes() -> void:
	if !player:
		printerr("World: No player connected!")
