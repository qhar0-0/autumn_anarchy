extends Node2D
@onready var sprite = $sprite_leaf
@onready var player_pos = get_parent().anim.position
func _ready() -> void:
	sprite.frame = randi_range(0,1)
	position = player_pos
	
func _process(_delta: float) -> void:
	position.y -= 15
	if position.y <= -900:
		queue_free()

func _notification(what: int) -> void:
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		queue_free()


func _on_hitbox_area_entered(area: Area2D) -> void:
	if area == Game.enemy.hitbox:
		Game.enemy_health -= 5
