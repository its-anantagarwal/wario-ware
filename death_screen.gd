extends Node2D
@onready var red_flash : ColorRect = $RedFlash
@onready var subText : Node2D = $other_nodes/sub_text
@onready var restart_button : Button = $other_nodes/restart
var fading_in = true
var button_fading = false
func _ready() -> void:
	restart_button.modulate.a=0.0
	$other_nodes.visible = false
	$RedFlash.visible = true
	await get_tree().create_timer(0.2).timeout
	$RedFlash.visible = false
	await get_tree().create_timer(0.1).timeout
	$RedFlash.visible = true
	await get_tree().create_timer(0.2).timeout
	$RedFlash.visible = false
	subText.modulate.a = 0
	$other_nodes.visible = true
	await get_tree().create_timer(2.5).timeout
	fading_in = true
	
	
	$other_nodes/Character/death_screen_character.speech_finished.connect(_on_speech_finished)
	
	


func _process(delta: float) -> void:
	if fading_in:
		subText.modulate.a += 1.0*delta
		if subText.modulate.a>=1.0:
			subText.modulate.a = 1.0
			fading_in = false
			
	if button_fading:
		restart_button.modulate.a+=1.0*delta
		if restart_button.modulate.a>=1.0:
			restart_button.modulate.a = 1.0
			$other_nodes/restart.disabled = false
			button_fading = false


func _on_speech_finished():
	button_fading = true
	
