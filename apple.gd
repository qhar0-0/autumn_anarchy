extends Node2D
@onready var fall_spd = randf_range(1,2.5) 
func _process(_delta: float) -> void:
	position.y += fall_spd
	rotation_degrees += fall_spd

func _notification(what: int) -> void:
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		queue_free()

func _on_hitbox_body_entered(body: Node2D) -> void:
	if body == get_node("../../Player"):
		Game.lives -= 1
		queue_free()
		
