class_name NavComponent extends NavigationAgent2D

signal nav_target_path(pos: Vector2)

@export var target: Node2D = null
@export var parent: Node2D = null
@export var auto_repath_time := 0.5

@onready var nav_timer: Timer = $NavTimer

func _ready() -> void:
	nav_timer.wait_time = auto_repath_time

func make_path() -> void:
	if target and parent:
		target_position = target.global_position
		nav_target_path.emit(parent.to_local(get_next_path_position()).normalized())
	else:
		printerr("PATHFINDING ERR: Target/Parent param missing")

func _on_nav_timer_timeout() -> void:
	make_path()
