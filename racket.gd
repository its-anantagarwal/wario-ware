extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position = get_global_mouse_position()

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			swing()
			

func swing():
	$normal_racket.visible = false
	$hitting_racket.visible = true
	
	var areas= get_overlapping_areas()
	 
	for area in areas:
		if area.name == "fly1" or area.name == "fly2" or area.name == "fly3":
			area.die()
	
	await get_tree().create_timer(0.15).timeout

	$hitting_racket.visible = false
	$normal_racket.visible = true
