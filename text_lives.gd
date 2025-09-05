extends Sprite2D
func _ready() -> void:
	if Game.lang == "English":
		texture = load("res://Sprites/Untitled30_20250831215124.png")
	elif Game.lang == "Japanese":
		texture = load("res://Sprites/Untitled30_20250831215130.png")
