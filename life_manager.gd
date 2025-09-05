extends Node2D
@onready var life = preload("res://life.tscn")
@onready var life_array = []
@onready var life_y = -75
@onready var y_add = 0
func _ready() -> void:
	var start_life = life.instantiate()
	life_array += [start_life]
	start_life.position = Vector2(-400,-75)
	add_child(life_array[0])
	
	for i in range(Game.max_lives-1):
		life_array += [life_array[0].duplicate()]
		var life_x = 50 + floor((i+1) % 3) * 50
		#if (i+1)%4 == 0:
		y_add = floor((i+1)%8) * 45
		life_array[i+1].position = Vector2(-400 + life_x,life_y + y_add)
		add_child(life_array[i+1])

		
func _process(_delta: float) -> void:
	if Game.lives < get_child_count() and Game.lives > 0:
		var dead_life = (Game.max_lives - Game.lives)-1
		if has_node(get_path_to(get_child(dead_life))):
			get_child(dead_life).queue_free()
			remove_child(get_child(dead_life))
