extends AnimatedSprite2D
@onready var button = $"."
@onready var texture_var = 1
@onready var return_pressed = 0


func _on_return_button_pressed() -> void:
	if !return_pressed:
		$AudioStreamPlayer2D.play()
		if Game.lang == "English":
			play("return_pressed")
			texture_var = 0
			return_pressed = 1
			await animation_finished
			get_tree().call_deferred("change_scene_to_file",("res://main.tscn"))
			Game.level = 1
			Game.max_lives = 3
			Game.lives = Game.max_lives
			Game.score = 0
		elif Game.lang == "Japanese":
			texture_var = 0
			play("return_pressed_j")
			return_pressed = 1
			await animation_finished
			get_tree().call_deferred("change_scene_to_file",("res://main.tscn"))
			Game.level = 1
			Game.max_lives = 3
			Game.lives = Game.max_lives
			Game.score = 0


func _process(_delta: float) -> void:
	if Game.lang == "English" and texture_var == 1:
		button.play("return_pressed")
		button.pause()
		button.frame = 0
	elif Game.lang == "Japanese" and texture_var == 1:
		button.play("return_pressed_j")
		button.pause()
		button.frame = 0
