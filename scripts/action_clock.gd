class_name ActionClock extends Control

@export var slot_count = 4

var rotation_speed = 60.0
var previous_clock_rotation_degrees = 0
var clock_rotation_degrees = 0
var slot_positions = []
var next_slot = 0
var last_slot_done = false

@onready var clock_hand: TextureRect = $ClockHand
@onready var circle_ray: RayCast2D = $CircleRay

var action_slot: PackedScene = preload("res://scenes/ui/action_clock/action_slot.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_place_slots(slot_count)
	_test()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	_move_clock(delta)
	_check_slot_reached(slot_positions)

func _move_clock(delta: float) -> void:
	previous_clock_rotation_degrees = clock_rotation_degrees
	clock_rotation_degrees = fposmod(clock_rotation_degrees + rotation_speed * delta, 360)
	if previous_clock_rotation_degrees > clock_rotation_degrees:
		last_slot_done = false
	clock_hand.rotation_degrees = clock_rotation_degrees

func _check_slot_reached(slot_arr: Array):
	if clock_rotation_degrees > slot_arr[next_slot].clock_rotation and !last_slot_done:
		slot_arr[next_slot].try_do_action()
		if next_slot + 1 == slot_positions.size():
			last_slot_done = true
		next_slot = _increment_array_index_wrapping(slot_arr, next_slot) # helper func to support wraparound

func _place_slots(slot_number: int) -> void:
	if slot_number < 1:
		printerr("Invalid number of slots: must be at least 1")
		return
	var slot_interval = 360.0 / slot_number
	var slot_array = []
	for slot in slot_number:
		var slot_position = slot_interval * slot + slot_interval / 2
		circle_ray.rotation_degrees = slot_position
		var s = action_slot.instantiate()
		s.position = circle_ray.position + circle_ray.target_position.rotated(circle_ray.rotation) - s.size / 2
		s.clock_rotation = slot_position
		add_child(s)
		slot_array.append(s)
	slot_positions = slot_array
	move_child(clock_hand, -1)

func _increment_array_index_wrapping(arr: Array, current_index: int) -> int:
	return (current_index + 1) % arr.size()

func _add_action_to_slot(action: Action, slot_index) -> void:
	pass # call function in slot to add action
	
func _remove_action_from_slot(slot_index) -> void:
	pass
	
func _add_action_to_next(action: Action) -> void:
	pass
	
func _remove_action_from_next(action: Action) -> void:
	pass

func _test() -> void:
	slot_positions[0].replace_action(load("res://scenes/ui/action_clock/actions/action_dash.tscn").instantiate())
