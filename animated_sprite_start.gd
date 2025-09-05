extends AnimatedSprite2D
@onready var button = $"."
@onready var anim_timer = get_node("../TimerButtonStart")
@onready var texture_var = 1
@onready var last_frame = 0
@onready var start_pressed = 0
func _on_start_pressed() -> void:
	if !start_pressed:
		$"../../AudioStreamPlayer2D".play()
		if Game.lang == "English":
			play("button_start_pressed")
			anim_timer.start()
			texture_var = 0
			start_pressed = 1
			await anim_timer.timeout
			get_tree().call_deferred("change_scene_to_file",("res://world.tscn"))
		elif Game.lang == "Japanese":
			anim_timer.start()
			texture_var = 0
			start_pressed = 1
			play("button_start_pressed_j")
			await anim_timer.timeout
			get_tree().call_deferred("change_scene_to_file",("res://world.tscn"))

func _on_start_mouse_entered() -> void:
	if Game.lang == "English":
		button.play("button_start_pressed")
		button.pause()
		button.frame = 0
	elif Game.lang == "Japanese":
		button.play("button_start_pressed_j")
		button.pause()
		button.frame = 0

func _process(_delta: float) -> void:
	if Game.lang == "English" and texture_var == 1:
		button.play("button_start_pressed")
		button.pause()
		button.frame = 0
	elif Game.lang == "Japanese" and texture_var == 1:
		button.play("button_start_pressed_j")
		button.pause()
		button.frame = 0
	
	if Game.lang == "English" and texture_var == 2:
		button.play("button_start_pressed")
		if button.frame == 3:
			stop()
			texture_var = 1
	elif Game.lang == "Japanese" and texture_var == 2:
		button.play("button_start_pressed_j")
		if button.frame == 3:
			stop()
			texture_var = 1

func _on_timer_button_start_timeout() -> void:
	texture_var = 1
