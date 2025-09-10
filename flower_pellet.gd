extends Node2D
@onready var spd = 0
@onready var angle = 0
func _ready() -> void:
	scale = Vector2.ONE * 2
func _process(_delta: float) -> void:
	position += Vector2.UP.rotated(deg_to_rad(angle)) * Vector2.ONE * spd
	rotation_degrees = angle
	if position.y < -250:
		queue_free()
func _on_hitbox_body_entered(body: Node2D) -> void:
	if body == Game.player:
		Game.player_hurt()
		queue_free()
