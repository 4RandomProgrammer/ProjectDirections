extends Node2D

var points = 0

onready var pnt_counter = $Camera2D/CanvasLayer/Label

signal changeTime

func got_point():
	
	points += 1
	
	pnt_counter.set_text(str(points))
	
	if points % 5 == 0:
		emit_signal("changeTime")

func _on_StartScreen_pause():
	$Camera2D/CanvasLayer/Label.visible = !$Camera2D/CanvasLayer/Label.visible
