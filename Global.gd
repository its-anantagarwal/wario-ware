extends Node

var minigames_done = 0
var lives = 5

var game #reference to reset variables
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func reset_game():
	minigames_done = 0
	lives = 5
	##minigame 1
	#game.garlic_collected = 0
	#game.timer_end = false
	##minigame 2
	#game.buttons_pressed = 0
	#game.timer_end = false
	##minigame 3
	#game.flies_alive = 0
	#game.timer_end = false
