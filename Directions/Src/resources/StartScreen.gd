extends Control

signal pause

func _ready():
	pause()

func pause():
	var new_pause_state = not get_tree().paused
	get_tree().paused = not get_tree().paused
	self.visible = new_pause_state
	emit_signal("pause")

func _on_Button_pressed():
	pause()
