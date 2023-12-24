extends Node2D

signal carpmavar

var pipe = preload("res://scenes/bird_pipe.tscn")
var pipes = []
var speed = 20

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for pipe in pipes:
		pipe.position=pipe.position+Vector2(-0.1,0)
		if pipe.position.x < -300:
			pipes.erase(pipe)
			pipe.free()
	pass

func carptın():
	carpmavar.emit()
	print("ajıpsdhjıajıslkdasd")
	pass

func _on_timer_timeout():
	var newpipe = pipe.instantiate()
	self.add_child(newpipe)
	newpipe.get_node("Area2D").connect("area_shape_entered",carptın)
	newpipe.transform.origin = Vector2(300,randi_range(0,100))
	$Timer.start(speed)
	pipes.append(newpipe)



func _on_area_2d_area_entered(area):
	carpmavar.emit()
	pass
