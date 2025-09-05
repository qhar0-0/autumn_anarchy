extends Node2D

@onready var tween_intensity = 1.25
@onready var tween_duration = 0.25

@onready var button_start : TextureButton = $Start
@onready var button_lang : TextureButton = $Language

func _process(_delta: float) -> void:
	button_hovered(button_start)
	button_hovered(button_lang)

func start_tween(object : Object, property : String, final_val : Variant, duration : float):
	var tween = create_tween()
	tween.tween_property(object,property,final_val,duration)

func button_hovered(button : TextureButton):
	button.pivot_offset = button.size/2
	if button.is_hovered():
		start_tween(button,"scale",Vector2.ONE * tween_intensity,tween_duration)
	else:
		start_tween(button,"scale",Vector2.ONE,tween_duration)
