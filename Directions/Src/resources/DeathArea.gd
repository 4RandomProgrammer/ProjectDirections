extends Area2D


func _on_DeathArea_body_entered(body):
	body.explodo()
	$ResetTimer.start()

func _on_ResetTimer_timeout():
	assert(get_tree().reload_current_scene() == OK)
