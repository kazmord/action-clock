class_name ActionInventoryItem extends PanelContainer

@export var data: ActionInventoryItemData

@onready var icon: TextureRect = %Icon
@onready var label: Label = %Label
@onready var action: ClkMsg.Actions

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	icon.texture = data.icon
	label.text = data.name
	action = data.action
