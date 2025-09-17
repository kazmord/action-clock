class_name ActionInventory extends VBoxContainer

signal add_to_clock(action: ClkMsg.Actions)

var item_scene = preload("res://scenes/ui/action_inventory/action_inventory_item.tscn")
var test_data := ActionInventoryItemData.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	test_data.name = "test"
	test_data.icon = load("res://icon.svg")
	test_data.action = ClkMsg.Actions.SHOT
	add_new_item(test_data)
	test_data.name = "test2"
	test_data.icon = load("res://assets/action_icons/action_dash_icon.png")
	test_data.action = ClkMsg.Actions.SHOT
	add_new_item(test_data)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("use"):
		use_top()
		
func use_top() -> void:
	if get_child(0):
		print(get_child(0).action)
		add_to_clock.emit(get_child(0).action)
		get_child(0).queue_free()
	
func remove_top() -> void:
	get_child(0).remove()

func cycle() -> void:
	move_child(get_child(0), -1)
	
func add_new_item(data: ActionInventoryItemData) -> void:
	var item = item_scene.instantiate()
	item.data = data
	add_child(item)

#TODO: 	Track number of inventory items (children). 
#		Don't allow adding to inventory if number exceeds 4 by default.
#		Instead of getting child count from the tree every time a child is
#		added or removed, store child count in an int and increment/decrement
#		when adding/removing
func _on_child_entered_tree(node: Node) -> void:
	pass # Replace with function body.
