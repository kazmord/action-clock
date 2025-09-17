class_name UI extends CanvasLayer

@onready var action_clock: ActionClock = %ActionClock
@onready var action_inventory: ActionInventory = %ActionInventory

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	action_inventory.add_to_clock.connect(action_clock.add_new_action_to_next)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
