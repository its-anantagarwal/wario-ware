extends Node2D

@onready var falling_object = $fallingObject
@onready var spawn_timer = $spawnTimer
@onready var themed_timer: Node2D= $MinigameTimer

var timer_end = false

func _ready():
	spawn_timer.timeout.connect(spawn_object)
	$cup.Spilled.connect(_on_cup_spilled)
	await themed_timer.Timer(15.0)
	timer_end = true

func spawn_object():
	var new_object = falling_object.duplicate()

	new_object.visible = true

	var screen_width = get_viewport_rect().size.x

	new_object.position = Vector2(
		randf_range(screen_width * 0.3, screen_width * 0.8),
		-50.0
	)

	add_child(new_object)


func _process(delta: float) -> void:
	if timer_end:
		if Global.minigames_done>4:
			get_tree().change_scene_to_file("res://done_screen.tscn")
		else:
			get_tree().change_scene_to_file("res://level_scene.tscn")

func _on_cup_spilled():
	Global.minigames_done -=1
	Global.lives -= 1
	get_tree().change_scene_to_file("res://level_scene.tscn")
