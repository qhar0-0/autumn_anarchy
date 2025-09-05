extends TextureButton

@onready var anim = $AnimatedSprite2D
func _ready() -> void:
	if Game.lang == "English":
		texture_normal = load("res://Sprites/return.png")
	elif Game.lang == "Japanese":
		texture_normal = load("res://Sprites/return_j.png")
	position = anim.position
func _on_pressed() -> void:
	if Game.lang == "English":
		anim.play("return_pressed")
	elif Game.lang == "Japanese":
		anim.play("return_pressed_j")
	await anim.animation_finished
	$"..".get_tree().change_scene_to_file("res://main.tscn")
