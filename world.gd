extends Node2D
@onready var enemy = preload("res://enemy.tscn").instantiate()
func _ready() -> void:
	$AudioStreamPlayer2D.play()
	enemy.position = Vector2(0,-225)
	add_child(enemy)
