extends KinematicBody2D

var velocity = Vector2.ZERO

const SPEED = 240

func _physics_process(delta):
	
	velocity.x += -SPEED * delta
	velocity = move_and_slide(velocity)
	velocity.x = clamp(velocity.x,-SPEED, SPEED)

func _on_Deathboz_body_entered(_body):
	get_tree().reload_current_scene()
