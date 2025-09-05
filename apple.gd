extends Node2D
@onready var fall_spd = 1.3#randf_range(1,2.5) 
@onready var angle = randf_range(-0.95,0.95)
func _process(_delta: float) -> void:
	position+= Vector2.DOWN.rotated(angle) * fall_spd
	rotation_degrees += fall_spd
	if position.y > 700:
		queue_free()


func _notification(what: int) -> void:
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		queue_free()

func _on_hitbox_body_entered(body: Node2D) -> void:
	if body == get_node("../../Player"):
		Game.lives -= 1
		queue_free()
		
