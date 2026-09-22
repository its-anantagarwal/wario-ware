extends Area2D

var speed = 150
var direction = Vector2.ZERO

func _ready() -> void:
	$AnimatedSprite2D.play("flying")
	direction = Vector2(
		randf_range(-1.0, 1.0),
		randf_range(-1.0, 1.0)
	).normalized()


func _process(delta: float) -> void:
	position+=direction*speed*delta
	
	var screen_size = get_viewport_rect().size
	if global_position.x <= 50:
		global_position.x = 50
		direction.x = abs(direction.x)
	elif global_position.x>=screen_size.x-50:
		global_position.x = screen_size.x-50
		direction.x = -abs(direction.x)
	
	if global_position.y<=50:
		global_position.y = 50
		direction.y=abs(direction.y)
	elif global_position.y>=screen_size.y-50:
		global_position.y = screen_size.y-50
		direction.y = -abs(direction.y)
		
	
	if direction.x < 0:
		$AnimatedSprite2D.flip_h = true
	else:
		$AnimatedSprite2D.flip_h = false


func die():
	direction = Vector2.ZERO
	$AnimatedSprite2D.play("dead")
	get_parent().flies_alive-=1
