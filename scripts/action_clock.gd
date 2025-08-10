class_name ActionClock extends Control

@export var slot_count = 4

var rotation_speed = 60.0
var previous_clock_rotation_degrees = 0
var clock_rotation_degrees = 0
var slot_positions = []

@onready var clock_hand: TextureRect = $ClockHand
@onready var circle_ray: RayCast2D = $CircleRay

var test: PackedScene = preload("res://scenes/test_sprite.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_place_slots(slot_count)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	_move_clock(delta)
	print(str(previous_clock_rotation_degrees) + "->" + str(clock_rotation_degrees))
	_check_slot_reached(slot_positions)

func _move_clock(delta: float) -> void:
	previous_clock_rotation_degrees = clock_rotation_degrees
	clock_rotation_degrees = fposmod(clock_rotation_degrees + rotation_speed * delta, 360)
	clock_hand.rotation_degrees = clock_rotation_degrees

# TODO: Optimise
# instead of checking all slots iteratively, identify the "next slot".
# when clock position exceeds slot position, make the slot after it the "next slot"
# TODO 2: Actually do something more than printing
func _check_slot_reached(slots: Array):
	for slot in slots:
		if previous_clock_rotation_degrees < slot and slot < clock_rotation_degrees:
			print(slot)

func _place_slots(slot_number: int) -> void:
	if slot_number < 1:
		printerr("Invalid number of slots: must be at least 1")
		return
	var slot_interval = 360.0 / slot_number
	var slot_array = []
	for slot in slot_number:
		var slot_position = slot_interval * slot + slot_interval / 2
		circle_ray.rotation_degrees = slot_position
		var t_sprite = test.instantiate() #TODO: use actual slots
		t_sprite.position = circle_ray.position + circle_ray.target_position.rotated(circle_ray.rotation)
		add_child(t_sprite)
		slot_array.append(slot_position)
		move_child(clock_hand, -1)
	slot_positions = slot_array
