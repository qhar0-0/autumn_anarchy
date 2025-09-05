extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Game.lang == "English":
		texture = load("res://Sprites/Untitled30_20250831133657.png")
	elif Game.lang == "Japanese":
		texture = load("res://Sprites/Untitled30_20250831173451.png")
		position.y -= 12
		scale = Vector2(1.2,1.2)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
