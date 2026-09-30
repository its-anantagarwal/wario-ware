extends Area2D

@export var fall_speed: float = 350.0

func _process(delta):
	if visible:
		position.y += fall_speed * delta
		if position.y>get_viewport_rect().size.y+100:
			queue_free()


func _on_area_entered(area: Area2D) -> void:
	print("HIT!")
	var cup = area.get_parent()
	if cup.has_method("hit"):
		var hit_direction = sign(global_position.x - cup.global_position.x)
		cup.hit(hit_direction)
	
	queue_free()
