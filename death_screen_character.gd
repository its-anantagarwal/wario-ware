extends AnimatedSprite2D

var centre_x
var speech_played = false

signal speech_finished

func _ready() -> void:
	centre_x = get_viewport_rect().size.x/2


func _process(delta: float) -> void:
	if position.x<centre_x:
		position.x +=100*delta
		$".".play("run")
	else:
		position.x = centre_x
		$".".play("idle")
		$"../speech_bubble".visible = true
		
		if not speech_played:
			$"../speech_bubble".play("default")
			await $"../speech_bubble".animation_finished
			speech_finished.emit()
			speech_played = true
			
