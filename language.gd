extends TextureButton
@onready var anim = $AnimatedSpriteLang
@onready var sprite_start = get_node("../Start/AnimatedSpriteStart")
@onready var button = get_node(".")
@onready var anim_timer = get_node("../Start/TimerButtonStart")

func _process(_delta : float) -> void:
	if Game.lang == "English":
		self.texture_normal = load("res://Sprites/lang.png")
	elif Game.lang == "Japanese":
		self.texture_normal = load("res://Sprites/lang_j.png")
		
func _on_pressed() -> void:
	if Game.lang == "English":
		Game.lang = "Japanese"
		anim_timer.start()
		sprite_start.last_frame = sprite_start.get_frame()
		anim.play("lang_pressed_j")
		sprite_start.texture_var = 2
		
	elif Game.lang == "Japanese":
		Game.lang = "English"
		
		anim_timer.start()
		sprite_start.last_frame = sprite_start.get_frame()
		anim.play("lang_pressed")
		sprite_start.texture_var = 2
	$"../AudioStreamPlayer2D".play()
