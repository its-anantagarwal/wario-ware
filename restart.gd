extends Button



func _ready() -> void:
	pass



func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	Global.reset_game()
	get_tree().change_scene_to_file("res://title_screen.tscn")
