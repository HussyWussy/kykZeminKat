extends Control
@onready var stabiliteLabel = $Label
var stabilite = 100

var sifre = randi_range(1000,9999)


var parca_sayisi = 0
var sayi_oyunu_scene = preload("res://scenes/sayi_oyunu.tscn")
var kol_oyunu_scene = preload("res://scenes/kol_oyunu.tscn")
var kuş_oyunu_scene = preload("res://scenes/kuş_oyunu.tscn")
var sayi_oyunu
var kol_oyunu
var kuş_oyunu
var katsayi
var ilk_speed
var ilk_updateVakti
# Called when the node enters the scene tree for the first time.
func _ready():
	katsayi=1
	print(sifre)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if kol_oyunu!=null:
		if kol_oyunu.guc!=0:
			katsayi = 100/kol_oyunu.guc
			if kuş_oyunu!=null:
				kuş_oyunu.speed = ilk_speed*(1/katsayi)
			if sayi_oyunu!=null:
				sayi_oyunu.updateVakti = ilk_updateVakti*(1/katsayi)
		
	if stabilite<0:
		self.get_tree().change_scene_to_file("res://scenes/kaybettiniz.tscn")
		pass
	if sayi_oyunu==null and parca_sayisi>=1:
		sayi_oyunu = sayi_oyunu_scene.instantiate()
		add_child(sayi_oyunu)
		sayi_oyunu.connect("sayilaresitdegil",_on_sayi_oyunu_sayilaresitdegil)
		sayi_oyunu.position = position+Vector2(100,200)
		ilk_updateVakti = sayi_oyunu.updateVakti

		
	if kol_oyunu == null and parca_sayisi>=3:
		kol_oyunu = kol_oyunu_scene.instantiate()
		add_child(kol_oyunu)
		kol_oyunu.position = position+Vector2(700,100)
		
		
	if kuş_oyunu==null and parca_sayisi>=6:
		kuş_oyunu = kuş_oyunu_scene.instantiate()
		kuş_oyunu.position = position+Vector2(500,200)
		add_child(kuş_oyunu)
		kuş_oyunu.connect("carpmavar",_on_kuş_oyunu_carpmavar)
		ilk_speed = kuş_oyunu.speed
		
	if parca_sayisi== 9 and $Label2.text == "":
		$Label2.text = "Şifre ="+String.num(sifre)
	
func updateStabilite():
	stabiliteLabel.text = "%"+String.num(stabilite)

func _on_sayi_oyunu_sayilaresitdegil():
	stabilite = stabilite - 0.002*katsayi
	if !$AudioStreamPlayer2D.playing:
		$AudioStreamPlayer2D.pitch_scale=4
		$AudioStreamPlayer2D.volume_db=-20
		$AudioStreamPlayer2D.play()
	updateStabilite()
	pass # Replace with function body.


func _on_kuş_oyunu_carpmavar():
	stabilite = stabilite - 10*katsayi
	if !$AudioStreamPlayer2D.playing:
		$AudioStreamPlayer2D.pitch_scale=1
		$AudioStreamPlayer2D.volume_db=0
		$AudioStreamPlayer2D.play()
	updateStabilite()
	pass # Replace with function body.
