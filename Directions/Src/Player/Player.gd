extends KinematicBody2D

const MAX_VELOCITY = 240
const EXPLOSION = preload("res://Src/resources/Explosion.tscn")

var velocity = Vector2.ZERO
var direction_control = 1
signal rot

export (Vector2)var movement = Vector2(0,MAX_VELOCITY)

func _physics_process(delta):
	
	velocity += movement * delta * direction_control
	
	velocity.y = clamp(velocity.y, -MAX_VELOCITY, MAX_VELOCITY)
	
	if Input.is_action_just_pressed("ui_accept"):
		direction_control *= -1
		rotate(deg2rad(90) * direction_control)
		emit_signal("rot")
		velocity.y *= -1
	
	velocity = move_and_slide(velocity)


func explodo():
	
	$Sprite.visible = false
	$Node/Trail.visible = false
	
	movement = Vector2.ZERO
	velocity = Vector2.ZERO
	
	var explosion = EXPLOSION.instance()
	explosion.global_position = self.global_position
	explosion.emitting = true
	get_parent().add_child(explosion)
