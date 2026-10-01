extends Node2D

@onready var egg = $Egg
@onready var themed_timer: Node2D= $MinigameTimer

var rock_scene = preload("res://rock.tscn")
var timer_end = false

func _ready():
	randomize()
	spawn_rock()
	await themed_timer.Timer(25.0)
	timer_end = true
	


func spawn_rock():
	var rock = rock_scene.instantiate()

	var screen_size = get_viewport_rect().size
	var side = randi_range(0, 3)

	match side:
		0: # Top
			rock.global_position = Vector2(
				randf_range(0, screen_size.x),
				-50
			)

		1: # Right
			rock.global_position = Vector2(
				screen_size.x + 50,
				randf_range(0, screen_size.y)
			)

		2: # Bottom
			rock.global_position = Vector2(
				randf_range(0, screen_size.x),
				screen_size.y + 50
			)

		3: # Left
			rock.global_position = Vector2(
				-50,
				randf_range(0, screen_size.y)
			)

	rock.target = egg.global_position
	add_child(rock)


func _process(delta: float) -> void:
	if timer_end:
		if Global.minigames_done>5:
			get_tree().change_scene_to_file("res://done_screen.tscn")
		else:
			get_tree().change_scene_to_file("res://level_scene.tscn")


func _on_rock_timer_timeout() -> void:
	spawn_rock()


func _on_egg_area_entered(area: Area2D) -> void:
	if area.is_in_group("rocks"):
		Global.minigames_done-=1
		Global.lives-=1
		get_tree().call_deferred("change_scene_to_file", "res://level_scene.tscn")
