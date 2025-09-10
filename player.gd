extends CharacterBody2D


const SPEED = 300.0
@onready var anim = $AnimatedSpritePlayer
@onready var anim_wings = $AnimatedSpriteWings
@onready var a = 0
@onready var return_button = -1
@onready var rbutton_exists = 0
@onready var moveable = true
@onready var inv_frames_max = 50
@onready var inv_frames = 0
@onready var bullet_leaf = preload("res://bullet_leaf.tscn")
@onready var leaf_collision_node = null
@onready var bullet_spawn_delay = 0

func _ready():
	anim_wings.play("wings_flap")

func _process(_delta: float) -> void:
	a+= 1
	Game.player = self
	if inv_frames > 0:
		inv_frames-=1
	anim_wings.position = Vector2(anim_wings.position.x, 
	anim_wings.position.y + (sin(float(a)/40) * .1))
	var direction_v := Input.get_axis("ui_left", "ui_right")
	if moveable:
		if direction_v:
			velocity.x = direction_v * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)

		var direction_h := Input.get_axis("ui_up", "ui_down")
		if direction_h:
			velocity.y = direction_h * SPEED
		else:
			velocity.y = move_toward(velocity.y, 0, SPEED)
		move_and_slide()
	if Game.lives <= 0:
		if $"../AudioStreamPlayer2D".playing:
			$"../AudioStreamPlayer2D".stop()
		if !rbutton_exists:
			return_button = load("res://return_button.tscn").instantiate()
			add_child(return_button)
			var tween = create_tween()
			tween.set_parallel(true)
			return_button.top_level = true
			$"../text_score".top_level = true
			tween.tween_property($"../text_score","position", Vector2(-165,-50),0.8)
			tween.tween_property($"../text_score","scale", Vector2(2,2),0.8)
			rbutton_exists = true
		$"../game_over_bg".visible = true
		return_button.position = Vector2(0,100)
		moveable = false
	else:
		rbutton_exists = 0
		if return_button != -1:
			remove_child(return_button)
			return_button = -1
		moveable = true
		if Input.is_key_pressed(KEY_Z):
			bullet_spawn_delay -= 1
			if bullet_spawn_delay <= 0:
				var bullet = bullet_leaf.instantiate()
				leaf_collision_node = bullet
				add_child(bullet)
				bullet_spawn_delay = 10
		else:
			bullet_spawn_delay = 0


func _on_point_adder_timeout() -> void:
	if Game.lives > 0:
		Game.score += 1
