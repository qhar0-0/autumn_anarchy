extends Node2D
@onready var a = 0
@onready var sprite = $AnimatedSprite2D
@onready var mode = 0
@onready var type = randi() % 2
func _ready() -> void:
	sprite.frame = type
	sprite.scale = Vector2(0.45,0.45)
	skew = -10
	if mode == 0:
		var x_spawn = randi_range(-215,220)
		var y_spawn = randi_range(-265,320)
		position = Vector2(x_spawn,y_spawn)
	elif mode == 1:
		var x_spawn = randi_range(-215,220)
		var y_spawn = randi_range(-265,-280)
		position = Vector2(x_spawn,y_spawn)
func _process(_delta) -> void:
	a+=1
	position.y += abs(sin(a/50) * randf_range(0.65,1.15))
	position.x += sin(a/50) * 0.45
	if position.y >= 320:
		queue_free()
	
	
