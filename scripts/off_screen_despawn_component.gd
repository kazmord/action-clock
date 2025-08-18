class_name OffScreenDespawnComponent extends VisibleOnScreenNotifier2D

@export var parent: Node2D
@export var despawn_time := 1.0

@onready var despawn_timer: Timer = $DespawnTimer

func _on_screen_exited() -> void:
	despawn_timer.start()

func _on_screen_entered() -> void:
	despawn_timer.stop()

func _on_despawn_timer_timeout() -> void:
	if parent:
		if parent.has_method("despawn"):
			parent.despawn()
		else:
			parent.call_deferred("queue_free")
