class_name Action extends Node

signal delete
@export var icon: Texture2D
@export var uses_remaining := 1:
	set(new_number):
		uses_remaining = new_number
		if uses_remaining < 1:
			print("OUT OF USES! (" + str(uses_remaining) + ")")
			delete.emit()

enum ActionSignalIds {
	DASH,
	BASIC_SHOT
}

func do_action() -> void:
	printerr("BLANK ACTION - polymorph this!")

func decrement_uses() -> void:
	uses_remaining = uses_remaining - 1
