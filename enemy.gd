extends Node2D
@onready var wings = $enemy_wings
@onready var body = $enemy_body
@onready var flower = $enemy_flower
@onready var a = 0
@onready var flower_follow = true
@onready var apple = preload("res://apple.tscn")
@onready var spawnable = true
@onready var apple_var = 0
@onready var more_apple_frequency = randi_range(16,32)
func _ready() -> void:
	wings.play("enemy_wings_flap")
	var start_apple = apple.instantiate()
	start_apple.position = position
	add_child(start_apple)
	
func _process(_delta: float) -> void:
	a+=1
	var aa = float(a)
	body.position.x = sin(aa/180)*100
	body.position.y = sin(aa/90)*10 + 30
	if flower_follow:
		flower.position.x = body.position.x
		flower.position.y = sin(aa/30)*.75 - 30
	wings.position.y += sin(aa/35)*0.1
	wings.position.x = body.position.x + 5
	if int(aa)%30 == 0:
		flower.rotation_degrees += 45
		
func _on_hurter_spawn_delay_timeout() -> void:
	if spawnable:
		var start_apple = apple.instantiate()
		start_apple.position = position
		apple_var += 1
		var new_apple = start_apple.duplicate()
		new_apple.position = body.position
		$".".add_child(new_apple)
