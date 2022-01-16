tool
extends HBoxContainer


export var BodyValue : int = 5
export var MindValue : int = 5
export var SpiritValue : int = 5
export (String, "pink_baby", "cream_baby", "blue_baby", "green_baby", "") var spritesheet = ""


func _ready():
	$BaseStats/BodyValue.text = str(BodyValue)
	$BaseStats/MindValue.text = str(MindValue)
	$BaseStats/SpiritValue.text = str(SpiritValue)
	$Container/PlayerPet.animation = spritesheet


func pass_type():
	match spritesheet:
		"pink_baby": 
			GameState.pet_type = GameState.type.PINK
		"green_baby": 
			GameState.pet_type = GameState.type.GREEN
		"cream_baby": 
			GameState.pet_type = GameState.type.CREAM
		"blue_baby": 
			GameState.pet_type = GameState.type.BLUE
		
		_: #default type
			GameState.pet_type = GameState.type.PINK
		



func _on_Button_mouse_entered():
	pass # Replace with function body.
	$Container/PlayerPet.speed_scale = 2


func _on_Button_mouse_exited():
	$Container/PlayerPet.speed_scale = 1
	pass # Replace with function body.


func _on_Button_pressed():
	get_tree().change_scene("res://Game/MainGame.tscn")
	pass_type()
	GameState.pet_life+=1
