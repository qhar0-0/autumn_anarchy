extends Node2D
@onready var leaf = preload("res://leaves.tscn")

func _ready() -> void:
	var temp_leaf1 = leaf.instantiate()
	var temp_leaf2 = temp_leaf1.duplicate()
	temp_leaf1.type = 0
	temp_leaf2.type = 1
	get_node("leaves").add_child(temp_leaf1)
	get_node("leaves").add_child(temp_leaf2)
	for i in range(65):
		var random_index = randi() % get_child_count()
		var random_child = get_child(random_index)
		random_child.duplicate()
		get_node("leaves").add_child(random_child)
		
		
func _on_timer_timeout() -> void:
	var temp_leaf1 = leaf.instantiate()
	var temp_leaf2 = temp_leaf1.duplicate()
	
	temp_leaf1.type = 0
	temp_leaf2.type = 1
	temp_leaf1.mode = 1
	temp_leaf2.mode = 1
	
	get_node("leaves").add_child(temp_leaf1)
	get_node("leaves").add_child(temp_leaf2)
	var random_index = randi() % get_child_count()
	var random_child = get_child(random_index)
	random_child.duplicate()
	get_node("leaves").add_child(random_child)
	
