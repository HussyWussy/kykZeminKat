extends StaticBody2D
var speed =0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	speed = move_toward(speed,0,0.01)
	move_and_collide(Vector2(0,speed))
	pass

func _process(delta):
	pass


func _on_button_pressed():
	speed = speed - 0.5
	pass # Replace with function body.


func _on_button_2_pressed():
	speed = speed + 0.5
	pass # Replace with function body.
