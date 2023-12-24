extends Node2D
var guc = 100
var gucharcama = 1
var dragable = false
var mouseison = false
@onready var kol = $kolkolu
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if guc>100:
		guc=100
	if guc < 0:
		guc = 0
	if !rotating:
		kol.rotate(-0.005)
	if tur:
		guc = guc + 0.02
		$yuzdelik.text = "%"+String.num(guc)
		tur = false
		


func _on_timer_timeout():
	if !rotating:
		guc = guc - gucharcama
		$yuzdelik.text = "%"+String.num(guc)
		$Timer.start(1)
	pass # Replace with function body.
var angle = 0
var mousepos = 0
var rotating = false
var kazanılacakguc = 0
var tur = false
var baslagıcrotation = 0
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if baslagıcrotation!=0:
				baslagıcrotation = kol.rotation
			if event.pressed:
				if mouseison:
					var angle = kol.rotation
					mousepos = get_local_mouse_position().rotated(rotation)
					
					rotating = true
				
			else:
				baslagıcrotation = 0
				rotating=false
			
				
	if event is InputEventMouseMotion and rotating:
		var currentmousepos = get_local_mouse_position().rotated(rotation)
		var rotationangle = mousepos.angle_to(currentmousepos)
		kol.rotation = rotationangle+angle
		if kol.rotation:
			tur=true
			
		
		
		
		
	pass # Replace with function body.


func _on_area_2d_mouse_entered():
	mouseison=true
	pass # Replace with function body.


func _on_area_2d_mouse_exited():
	mouseison=false
	pass # Replace with function body.
