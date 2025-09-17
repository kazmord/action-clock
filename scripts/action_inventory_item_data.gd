class_name ActionInventoryItemData extends Resource

@export var name: String = "Default"
@export var icon: Texture2D = load("res://assets/action_icons/action_null_icon.png")
@export var action: ClkMsg.Actions = ClkMsg.Actions.SHOT
func use() -> void:
	pass
