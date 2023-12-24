extends MeshInstance3D

var sifre 

# Called when the node enters the scene tree for the first time.
func _ready():
	sifre = self.get_parent().get_node("player").get_node("makine").sifre
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $sayi_girme_oyunu/Label.text==String.num(sifre):
		get_tree().change_scene_to_file("res://scenes/kazandınız.tscn")
	pass


func _on_area_3d_body_shape_exited(body_rid, body, body_shape_index, local_shape_index):
	Input.mouse_mode=Input.MOUSE_MODE_CAPTURED
	$sayi_girme_oyunu.visible = false
	pass # Replace with function body.


func _on_area_3d_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	Input.mouse_mode=Input.MOUSE_MODE_VISIBLE
	$sayi_girme_oyunu.visible = true
	
	pass # Replace with function body.
