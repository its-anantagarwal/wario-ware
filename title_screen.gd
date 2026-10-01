extends Node2D




func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://level_scene.tscn")


func _on_controls_pressed() -> void:
	$ControlsPanel.visible = true


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_close_controls_pressed() -> void:
	$ControlsPanel.visible = false


func _on_how_to_play_pressed() -> void:
	$HowToPlayPanel.visible = true


func _on_close_how_to_play_pressed() -> void:
	$HowToPlayPanel.visible = false
