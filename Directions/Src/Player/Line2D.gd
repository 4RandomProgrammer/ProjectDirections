extends Line2D

var target
var point
export (Vector2)var pos = Vector2(8,4)
export (NodePath)var targetPath
export (int)var trailLength = 8

func _ready():
	target = get_node(targetPath)

func _process(delta):
	
	point = target.global_position
	add_point(point)
	
	
	while get_point_count() > trailLength:
		remove_point(0)
		
	for i in range(get_point_count()):
		set_point_position(i, get_point_position(i) - pos)


func _on_Player_rot():
	pos.y *= -1
