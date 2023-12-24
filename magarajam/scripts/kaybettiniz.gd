extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	self.get_tree().change_scene_to_file("res://scenes/start.tscn")
	pass # Replace with function body.


func _on_button_2_pressed():
	self.get_tree().change_scene_to_file("res://scenes/world.tscn")
	pass # Replace with function body.
