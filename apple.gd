extends Node2D
@onready var fall_spd = 8#randf_range(1,2.5) 
@onready var angle = randf_range(-0.95,0.95)
@onready var pos_previous = Vector2.ZERO
@onready var player = get_node("../../Player")
func _ready() -> void:
	pos_previous = position
func _process(_delta: float) -> void:
	position+= Vector2.DOWN.rotated(angle) * (Vector2.ONE*fall_spd)
	rotation_degrees += fall_spd
	if position.y > 700:
		queue_free()

func _notification(what: int) -> void:
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		queue_free()

func _on_hitbox_body_entered(body: Node2D) -> void:
	if body == player:
		Game.player_hurt()
		queue_free()
		
