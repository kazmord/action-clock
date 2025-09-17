class_name ActionSlot extends PanelContainer

@export var action: Action = load("res://scenes/ui/action_clock/actions/action_null.tscn").instantiate():
	set(new_action):
		action = new_action
		if !action.delete.is_connected(empty_action_slot):
			action.delete.connect(empty_action_slot)
		icon.texture = action.icon
@export var clock_rotation: float

@onready var icon: TextureRect = $MarginContainer/Icon

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if !action.delete.is_connected(empty_action_slot):
			action.delete.connect(empty_action_slot)
	icon.texture = action.icon

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func try_do_action() -> void:
	action.do_action()

func replace_action(new_action: Action) -> void:
	action = new_action

func empty_action_slot() -> void:
	action = load("res://scenes/ui/action_clock/actions/action_null.tscn").instantiate()
