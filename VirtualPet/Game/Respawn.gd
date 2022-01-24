extends Node2D


func _ready():
	yield(get_tree(), "idle_frame")
	$Popup.popup_centered()
	GameState.Happines = 100
	GameState.Health = 100
	GameState.Energy = 100
	GameState.pet_days = 0
