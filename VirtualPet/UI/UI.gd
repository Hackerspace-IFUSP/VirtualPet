extends CanvasLayer


func _ready():
	update_gui()

func update_gui():
	$Control/HBoxContainer/Name.text = GameState.pet_name
	$Control/HBoxContainer/Life.text = "life " + str(GameState.pet_life)
	$Control/HBoxContainer/Age.text = GameState.pet_age
	$Control/HBoxContainer/Day.text = "Day " + str(GameState.days_passed)
