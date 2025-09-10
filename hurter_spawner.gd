extends Node2D
#@onready var apple = preload("res://apple.tscn")
#@onready var spawnable = true

#func _ready() -> void:
	#var start_apple = apple.instantiate()
	#start_apple.position = position
	#add_child(start_apple)
#
#func _on_hurter_spawn_delay_timeout() -> void:
	#if spawnable:
		#var start_apple = apple.instantiate()
		#start_apple.position = Vector2(randi_range(-260,270),-280)
		#var temp_apple = start_apple.duplicate()
		#temp_apple.position = Vector2(randi_range(-260,270),-280)
		#add_child(temp_apple)
