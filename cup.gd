extends Node2D

signal Spilled

@export var speed: float = 300.0
@export var recovery_speed: float = 0.9

var spill_timer := 0.0
var spill_limit := 0.7
var spilled := false

func _process(delta):
	var direction = Input.get_axis("left", "right")
	position.x += direction * speed * delta
	position.x = clamp(position.x, 100.0, 1080.0)
	rotation = lerp_angle(rotation, 0.0, recovery_speed * delta)
	
	var tilt = abs(rotation_degrees)

	if tilt > 20.0:
		spill_timer += delta
	else:
		spill_timer = 0.0

	if spill_timer >= spill_limit:
		spilled = true
		Spilled.emit()

func hit(direction):
	rotation_degrees += direction * 25.0
