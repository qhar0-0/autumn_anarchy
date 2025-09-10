extends Node
var lang = "English"
var level = 1
var max_lives = 3
var lives = max_lives
var score = 0
var player = null
var enemy = null
var enemy_health_max = 1850
var enemy_health = enemy_health_max
var bullet_leaf = null
func player_hurt() -> void:
	if player.inv_frames <= 0:
		lives-=1
		player.inv_frames = player.inv_frames_max
