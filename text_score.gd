extends Sprite2D
@onready var score_num = []
@onready var digits = str(abs(Game.score)).length()
func _ready() -> void:
	for i in range(9):
		score_num += [get_node("score_" + str(i))]
	if Game.lang == "English":
		texture = load("res://Sprites/Untitled30_20250831133620.png")
	elif Game.lang == "Japanese":
		texture = load("res://Sprites/Untitled30_20250831133605.png")

func _process(_delta: float) -> void:
	digits = str(abs(Game.score)).length()
	if digits >= 2:
		for i in range(digits):
			if i != digits:
				score_num[i-1].frame = int((Game.score / pow(10,i-1))) % 10
			score_num[digits-1].frame = int(str(Game.score)[0])
	else:
		score_num[digits-1].frame = int(str(Game.score)[0])
		
