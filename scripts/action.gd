class_name Action extends Node

@export var icon: Sprite2D

enum ActionSignalIds {
	DASH,
	BASIC_SHOT
}

func do_action() -> void:
	printerr("BLANK ACTION - polymorph this!")
