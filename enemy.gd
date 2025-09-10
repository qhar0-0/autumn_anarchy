extends Node2D
@onready var wings = $enemy_wings
@onready var body = $enemy_body
@onready var flower = $enemy_flower
@onready var a = 0
@onready var flower_follow = true
@onready var apple = preload("res://hurter_objects/apple.tscn")
@onready var spawnable = true
@onready var apple_var = 0
@onready var more_apple_frequency = randi_range(8,16)
@onready var beam_frequency = randi_range(400,600)
@onready var bullet_leaf = preload("res://bullet_leaf.tscn")
@onready var hitbox = $hitbox
func _ready() -> void:
	wings.play("enemy_wings_flap")
	var start_apple = apple.instantiate()
	start_apple.position = position
	add_child(start_apple)
	
func _process(_delta: float) -> void:
	a+=1
	Game.enemy = self
	var aa = float(a)
	body.position.x = sin(aa/90)*100
	body.position.y = sin(aa/45)*10 + 30
	if flower_follow:
		flower.position.x = body.position.x
		flower.position.y = -sin(aa/30)*2 - 35
	wings.position.y = sin(aa/35)*1.3 -60
	wings.position.x = body.position.x + 5
	if int(aa)%69 == 0:
		flower.rotation_degrees += 45
	if int(aa)%int(beam_frequency) == 0:
		var beam_start = load("res://hurter_objects/flower_beam.tscn").instantiate()
		var beam = beam_start.duplicate()
		beam.position.x = randi_range(-250,250)
		beam.position.y = -100
		beam_frequency = randi_range(400,600)
		add_child(beam)
	queue_redraw()

func _draw() -> void:
	draw_rect(Rect2(-245,-10,Game.enemy_health/float(4),15),Color.GREEN)


func _on_hurter_spawn_delay_timeout() -> void:
	if spawnable:
		var start_apple = apple.instantiate()
		start_apple.position = position
		apple_var += 1
		if apple_var < more_apple_frequency:
			var new_apple = start_apple.duplicate()
			new_apple.position = body.position
			$".".add_child(new_apple)
		elif apple_var == more_apple_frequency:
			var repeat = (randi_range(4,8))
			more_apple_frequency = randi_range(8,16)
			while repeat > 0:
				var new_apple = start_apple.duplicate()
				new_apple.position = body.position
				$".".add_child(new_apple)
				repeat-=1
				await get_tree().create_timer(0.0875).timeout
				apple_var = 0


func _notification(what: int) -> void:
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		queue_free()
