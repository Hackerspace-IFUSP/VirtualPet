extends Node2D


func _ready():
	yield(get_tree(),"idle_frame")
	set_anim()
	print(GameState.pet_type)
	if GameState.day:
		$Background.frame = 0
		$PlayerPet.speed_scale = 1
	if not GameState.day:
		$Background.frame = 1
		$PlayerPet.speed_scale = .5


func set_anim():
	if GameState.pet_age == "baby":
			match GameState.pet_type:
				GameState.type.GREEN:
					$PlayerPet.play("green_baby")
				GameState.type.BLUE:
					$PlayerPet.play("blue_baby")
				GameState.type.CREAM:
					$PlayerPet.play("cream_baby")
				GameState.type.PINK:
					$PlayerPet.play("pink_baby")


func _on_Timer_timeout():
	GameState.day = !GameState.day
	if GameState.day:
		$Background.frame = 0
		GameState.days_passed+=1
		get_tree().call_group("GUI", "update_gui")
		$PlayerPet.speed_scale = 1
	if not GameState.day:
		$Background.frame = 1
		$PlayerPet.speed_scale = .5
	$Timer.start()


func _on_Play_pressed():
	get_tree().change_scene("res://MiniGame/JoKenPo.tscn")
