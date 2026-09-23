extends VBoxContainer
@onready var Credits : VBoxContainer = $"."
var screen_height

func _ready() -> void:
	screen_height = get_viewport_rect().size.y
	Credits.position.y = screen_height




func _process(delta: float) -> void:
	if Credits.position.y>screen_height*0.55:
		Credits.position.y -= 50 * delta
	else:
		Credits.position.y = screen_height*0.55
