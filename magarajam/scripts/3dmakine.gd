extends MeshInstance3D

@onready var player = self.get_parent().get_node("player")
@onready var makine_ici = player.get_node("makine")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_static_body_3d_input_event(camera, event, position, normal, shape_idx):
	pass # Replace with function body.


func _on_area_3d_body_entered(body):
	player.get_node("makine").visible = true
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	player.near_machine = true
	if player.pickedup:
		makine_ici.parca_sayisi = makine_ici.parca_sayisi + 1
		player.pickedup=false
		player.pickupoject.queue_free()
	
	pass # Replace with function body.


func _on_area_3d_body_exited(body):
	player.get_node("makine").visible = false
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	player.near_machine = false
	pass # Replace with function body.
