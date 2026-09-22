extends Node2D

@onready var themed_timer: Node2D= $MinigameTimer

var flies_alive = 3
var timer_end = false


func _ready() -> void:
	await themed_timer.Timer(15.0)
	timer_end = true



func _process(delta: float) -> void:
	if flies_alive == 0:
		if Global.minigames_done > 3:
			get_tree().change_scene_to_file("res://done_screen.tscn")
		else:
			get_tree().change_scene_to_file("res://level_scene.tscn")
	
	if timer_end:
		Global.lives -= 1
		Global.minigames_done -=1
		get_tree().change_scene_to_file("res://level_scene.tscn")
