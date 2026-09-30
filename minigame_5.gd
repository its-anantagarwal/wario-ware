extends Node2D

@onready var egg = $Egg

var rock_scene = preload("res://rock.tscn")

func _ready():
	randomize()
	spawn_rock()
	


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
	pass


func _on_rock_timer_timeout() -> void:
	spawn_rock()
