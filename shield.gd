extends Area2D

@export var egg: Node2D
@export var radius: float = 90.0
@export var rotation_speed: float = 12.0

func _process(delta):
	if egg == null:
		return

	var mouse_position = get_global_mouse_position()
	var direction = mouse_position - egg.global_position

	if direction.length() == 0:
		return

	var target_angle = direction.angle()
	var target_position = egg.global_position + Vector2.RIGHT.rotated(target_angle) * radius

	global_position = global_position.lerp(target_position, rotation_speed * delta)
	rotation = target_angle


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("rocks"):
		area.queue_free()
