extends Popup


func _ready():
	pass


func _on_Button_pressed():
	GameState.pet_name = $VBoxContainer/Name/LineEdit.text
	$VBoxContainer/Pet1.show()
	$VBoxContainer/Pet2.show()
	$VBoxContainer/Pet3.show()
	$VBoxContainer/Pet4.show()
	$VBoxContainer/Name/LineEdit.editable = false
	$VBoxContainer/Name/Button.disabled = true
	
