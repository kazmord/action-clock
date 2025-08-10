class_name ActionSlot extends PanelContainer

@export var action: Action = ActionNull.new()
@export var clock_rotation: float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func try_do_action() -> void:
	action.do_action()
