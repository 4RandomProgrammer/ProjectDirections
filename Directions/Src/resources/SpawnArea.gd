extends Area2D

const RET = preload("res://Src/obstacles/RetObs.tscn")
const TRIANG = preload("res://Src/obstacles/TriangObs.tscn")
const RET2 = preload("res://Src/obstacles/RetangObs2.tscn")

export (float)var time = 2.0
onready var spawnTimer = $SpawnTimer
onready var pos = $Position2D.global_position


func _ready():
	spawnTimer.start(time)



func _on_SpawnTimer_timeout():
	var rand = randi() % 2
	
	match rand:
		0:
			spawnRet()
		1:
			spawnTriang()
		2:
			spawnRet2()

func spawnRet2():
	var obstaculo = RET2.instance()
	get_parent().add_child(obstaculo)
	obstaculo.position = randomPos()
	spawnTimer.start(time)

func spawnTriang():
	var obstaculo = TRIANG.instance()
	get_parent().add_child(obstaculo)
	obstaculo.position = randomPos()
	spawnTimer.start(time)

func spawnRet():
	var obstaculo = RET.instance()
	get_parent().add_child(obstaculo)
	obstaculo.position = randomPos()
	spawnTimer.start(time)

func randomPos():
	var randY = rand_range(pos.y - 96, pos.y + 96)
	return Vector2(pos.x,randY)


func _on_World_changeTime():
	if time > 0.7:
		time -= 0.1
