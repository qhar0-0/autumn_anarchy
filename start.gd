extends TextureButton

@onready var anim = $AnimatedSpriteStart
@onready var button = $SpriteButtonStart
@onready var texture_eng = preload("res://Sprites/start.png")
@onready var texture_jpn = preload("res://Sprites/start_j.png")

func _ready():
	button.position = Vector2(position.x - 185,position.y-183)
	button.scale.x = 1.112
	button.scale.y = 1.068 
