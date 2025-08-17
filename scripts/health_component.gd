class_name HealthComponent extends Node

@export var max_hp := 10:
	set(new_max):
		max_hp = new_max
		if current_hp > max_hp:
			current_hp = max_hp
@export var current_hp := max_hp:
	set(new_cur):
		current_hp = new_cur
		print(current_hp)
		if current_hp < 1:
			hp_depleted.emit()

signal hp_depleted

# intuitive way to deal damage 
# rather than putting a negative number into change_hp directly
func take_damage(amount) -> void:
	change_hp(amount * -1)

func change_hp(amount) -> void:
	current_hp = min(current_hp + amount, max_hp)
	
func change_hp_to(new_value) -> void:
	current_hp = new_value
