extends Node3D

#sınır 1 -28 de sınır 2 +42 de aralarında 70 birim var

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_sınır_1_body_entered(body):
	pass # Replace with function body.


func _on_sınır_1_body_exited(body):
	$player.position=$player.position+Vector3(0,0,70)
	pass # Replace with function body.


func _on_sınır_2_body_entered(body):
	pass # Replace with function body.


func _on_sınır_2_body_exited(body):
	$player.position=$player.position-Vector3(0,0,70)
	pass # Replace with function body.
