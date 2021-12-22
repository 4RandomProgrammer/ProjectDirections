extends KinematicBody2D

var velocity = Vector2.ZERO

const SPEED = 300

signal point

func _ready():
	assert(connect("point", get_parent(), "got_point") == OK)

func _physics_process(_delta):
	
	velocity.x = -SPEED
	velocity = move_and_slide(velocity)
	velocity.x = clamp(velocity.x,-SPEED, SPEED)


func _on_Complete_body_entered(_body):
	emit_signal("point")


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
