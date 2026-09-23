extends AnimatedSprite2D

var speed=100
var centre_x

func _ready() -> void:
	centre_x = get_viewport_rect().size.x/2
	position.x = -100
	$".".flip_h = true


func _process(delta: float) -> void:
	if position.x<centre_x:
		position.x +=100*delta
	else:
		position.x = centre_x
		$".".play("sliding")
