extends Node2D

var hedef = randi_range(0,100)
var sayi = hedef + randi_range(-10,10)



signal sayilaresitdegil
var updateVakti = 30

@onready var sayiLabel = $sayimiz
@onready var hedefLabel = $hedefsayi
@onready var timer = $Timer
# Called when the node enters the scene tree for the first time.
func _ready():
	timer.start(updateVakti)
	sayiLabel.text=String.num(sayi)
	hedefLabel.text=String.num(hedef)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if sayiLabel.text != hedefLabel.text:
		sayilaresitdegil.emit()
	pass


func _on_artırma_pressed():
	sayi = sayi+1
	sayiLabel.text=String.num(sayi)
	pass # Replace with function body.


func _on_azaltma_pressed():
	sayi = sayi-1
	sayiLabel.text=String.num(sayi)
	pass # Replace with function body.


func _on_timer_timeout():
	hedef = randi_range(hedef-22,hedef+22)
	hedefLabel.text=String.num(hedef)
	updateVakti=randi_range(updateVakti-10,updateVakti+10)
	timer.start(updateVakti)
	pass # Replace with function body.
