extends Node

enum Actions { DASH, SHOT }
signal player_action(a: Actions)
signal clk_add_action(a: Actions)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func player_action_request(req_act: Actions) -> void:
	player_action.emit(req_act)
	
func clock_add_request(req_act: Actions) -> void:
	clk_add_action.emit(req_act)
