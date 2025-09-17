class_name ActionShot extends Action

signal action_msg(a: ClkMsg.Actions)

func _init() -> void:
	action_msg.connect(ClkMsg.player_action_request)
	print(action_msg.is_connected(ClkMsg.player_action_request))

func do_action():
	action_msg.emit(ClkMsg.Actions.SHOT)
	decrement_uses()
