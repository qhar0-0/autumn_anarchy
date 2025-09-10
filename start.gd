extends TextureButton

@onready var anim = $AnimatedSpriteStart
@onready var button = $SpriteButtonStart


func _ready():
	button.position = Vector2(position.x - 185,position.y-183)
	button.scale.x = 1.112
	button.scale.y = 1.068 
