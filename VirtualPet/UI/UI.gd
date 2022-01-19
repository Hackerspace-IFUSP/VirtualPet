extends CanvasLayer


func _ready():
	yield(get_tree(),"idle_frame")
	update_gui()

func update_gui():
	$Control/HBoxContainer/Name.text = GameState.pet_name
	$Control/HBoxContainer/Life.text = "life " + str(GameState.pet_life)
	$Control/HBoxContainer/Age.text = GameState.pet_age
	$Control/HBoxContainer/Day.text = "Day " + str(GameState.days_passed)
	$Control/Stats/Healt/HealtBar.value = GameState.Health
	$Control/Stats/Happines/HappyBar.value = GameState.Happines
	$Control/Stats/Energy/EnergyBar.value = GameState.Energy
	$Control/HBoxContainer2/PetAge.text = "pet age :" + str(GameState.pet_days)

