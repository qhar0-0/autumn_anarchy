extends Node2D
@onready var pellet = preload("res://hurter_objects/flower_pellet.tscn")
@onready var player = Game.player
@onready var pellets = 5
@onready var mode = 0
@onready var pellet_array = []
@onready var spread = false
func _ready() -> void:
	$Sprite2D.scale.y = 23
	$Sprite2D.modulate.a = float(1)/255
	var tween = create_tween().set_parallel(true)
	tween.tween_property($Sprite2D,"modulate:a",0.84,0.5)
	tween.tween_property($Sprite2D,"scale",Vector2(2.5,$Sprite2D.scale.y),0.5)
	await get_tree().create_timer(0.65).timeout
	modulate.a = 1
	await get_tree().create_timer(0.05).timeout
	create_tween().tween_property($Sprite2D,"modulate:a",-1,0.5)
	create_tween().tween_property($Sprite2D,"scale",Vector2(1,$Sprite2D.scale.y),0.5)
	if mode == 0:
		$Sprite2D.position.y = -270
		for i in range(pellets):
			var start_pellet = pellet.instantiate()
			start_pellet.position.y = 700
			add_child(start_pellet)
			var pellet_left = start_pellet.duplicate()
			#pellet_left.position = position + (Vector2.DOWN.rotated(rotation_degrees) * (Vector2.ONE * pellet_distance * i))
			$".".add_child(pellet_left)
			var pellet_right = start_pellet.duplicate()
			#pellet_right.position = position + (Vector2.DOWN.rotated(rotation_degrees) * (Vector2.ONE * pellet_distance * (i+1)))
			$".".add_child(pellet_right)
			pellet_array.append(pellet_left)
			pellet_array.append(pellet_right)
		#await get_tree().create_timer(0.05).timeout
	await get_tree().create_timer(0.45).timeout
	for i in range(pellet_array.size()-1):
			pellet_array[i].spd = 8
			pellet_array[i].angle = -80 + 30*i
		
func _on_hitbox_body_entered(body: Node2D) -> void:
	if body == player and $Sprite2D.modulate.a >= 0.2:
		Game.player_hurt()
func _process(_delta: float) -> void:
	if modulate.a <= 0:
		get_parent().remove_child(self)
		queue_free()
