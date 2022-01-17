extends Node2D


func _ready():
	
	GameState.connect("tired",self,"_on_PlayerPet_tired",[],CONNECT_ONESHOT)
	GameState.connect("died",self,"_on_PlayerPet_died",[],CONNECT_ONESHOT)
	yield(get_tree(),"idle_frame")
	set_anim()
	print(GameState.pet_type)
	if GameState.day:
		$Background.frame = 0
		$PlayerPet.speed_scale = 1
	if not GameState.day:
		$Background.frame = 1
		$PlayerPet.speed_scale = .5
	get_tree().call_group("GUI", "update_gui")

func _process(delta):
	GameState.Energy-=.02
	$UI/Control/Stats/Energy/EnergyBar.value = GameState.Energy
	
	GameState.Happines-=.01
	$UI/Control/Stats/Happines/HappyBar.value = GameState.Happines
	
	GameState.Health-=.01
	$UI/Control/Stats/Healt/HealtBar.value = GameState.Health
	


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
	GameState.Energy-=10
	GameState.Happines+=10
	get_tree().call_group("GUI", "update_gui")
	get_tree().change_scene("res://MiniGame/JoKenPo.tscn")


func _on_Sleep_pressed():
	$Background.frame = 0
	GameState.days_passed+=1
	get_tree().call_group("GUI", "update_gui")
	$PlayerPet.speed_scale = 1
	
	$UI/Control/Actions/Play.disabled = false
	
	GameState.Energy = 100
	$UI/Control/Stats/Energy/EnergyBar.value = GameState.Energy


func _on_PlayerPet_died():
	$PlayerPet.died()
	#$PlayerPet/DeathTimer.start()
	#get_tree().change_scene("res://Game/Respawn.tscn")


func _on_PlayerPet_tired():
	$UI/Control/Actions/Play.disabled = true
