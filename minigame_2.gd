extends Node2D
@onready var themed_timer: Node2D = $MinigameTimer

var buttons_pressed := 0
var timer_end = false

func _ready() -> void:
	await themed_timer.Timer(7.0)
	timer_end = true 


func _process(delta: float) -> void:
	if buttons_pressed == 5:
		if Global.minigames_done > 3:
			get_tree().change_scene_to_file("res://done_screen.tscn")
		else:
			get_tree().change_scene_to_file("res://level_scene.tscn")
	
	if timer_end:
		Global.lives -= 1
		Global.minigames_done -=1
		get_tree().change_scene_to_file("res://level_scene.tscn")
