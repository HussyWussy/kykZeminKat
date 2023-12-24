extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(10):
		var button :Button = get_child(i)
		button.connect("pressed",basma.bind(button.text))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func basma(number):
	if len($Label.text)> 3:
		$Label.text = ""
	$Label.text += number
