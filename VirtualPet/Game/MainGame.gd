extends Node2D

var is_pleased = true
enum needs {food, bath, play, none = -1}
var need_now = needs.none


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

	randomize()
	$Need.wait_time = 1 + randi () % 5
	$Need.start()


func _process(delta):
	#GameState.Energy-=.02
	$UI/Control/Stats/Energy/EnergyBar.value = GameState.Energy
	
	#GameState.Happines-=.1
	$UI/Control/Stats/Happines/HappyBar.value = GameState.Happines
	
	#GameState.Health-=.1
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
	if GameState.pet_age == "child":
		match GameState.pet_type:
				GameState.type.GREEN:
					$PlayerPet.play("child_green")
				GameState.type.BLUE:
					$PlayerPet.play("child_blue")
				GameState.type.CREAM:
					$PlayerPet.play("child_cream")
				GameState.type.PINK:
					$PlayerPet.play("child_pink")
	if GameState.pet_age == "adult":
		match GameState.pet_type:
				GameState.type.GREEN:
					$PlayerPet.play("adult_green")
				GameState.type.BLUE:
					$PlayerPet.play("adult_blue")
				GameState.type.CREAM:
					$PlayerPet.play("adult_cream")
				GameState.type.PINK:
					$PlayerPet.play("adult_pink")


func _on_Timer_timeout():
#	GameState.day = !GameState.day
#	if GameState.day:
#		$Background.frame = 0
#		GameState.days_passed+=1
#		GameState.pet_days+=1
#		get_tree().call_group("GUI", "update_gui")
#		$PlayerPet.speed_scale = 1
#	if not GameState.day:
#		$Background.frame = 1
#		$PlayerPet.speed_scale = .5
#	$Timer.start()
#	set_anim()
	pass

func _on_Play_pressed():
	if GameState.Energy >= 10:
		GameState.Energy-=10
		if is_pleased == false and need_now == needs.play:
			GameState.Happines+=20
			is_pleased = true
			need_now = needs.none
			need_text()
#			$Need.start()
		else:
			GameState.Happines+=10
		$UI/Control/Actions/SFX/Button4.play()
		yield($UI/Control/Actions/SFX/Button4,"finished")
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

	$UI/Control/Actions/SFX/Button3.play()

func _on_PlayerPet_died():
	$PlayerPet.died()
	$Timer.stop()
	$UI/Control/Button.disabled = true
	#$PlayerPet/DeathTimer.start()
	#get_tree().change_scene("res://Game/Respawn.tscn")


func _on_PlayerPet_tired():
	$UI/Control/Actions/Play.disabled = true


func _on_Need_timeout():
#	print("começou")
#	var next_need = randi() % 3
#	need_now = next_need
#	is_pleased = false
#	need_text()
#
#	$WaitAction.start()	
	pass

func need_text():
		match need_now:
			0:
				$TextureRect.text = "food"
			1:
				$TextureRect.text = "bath"
			2:
				$TextureRect.text = "play"
			_:
				$TextureRect.text = "none"

func _on_Food_pressed():
	if need_now == needs.food and is_pleased == false:
		GameState.Happines+=10
		GameState.Health+=10
		get_tree().call_group("GUI", "update_gui")
		need_now = needs.none
		is_pleased = true	
		$UI/Control/Actions/SFX/Button1.play()
		need_text()
	
func _on_Wait_action_timeout():
#	if not is_pleased:
#		print("n deu =( ")
#		match need_now:
#			0:
#				GameState.Health -= 10
#				GameState.Happines -= 10
#			1:
#				GameState.Health -= 10
#				GameState.Happines -= 10
#			2:
#				GameState.Happines -= 10
#			_:
#				pass
#	get_tree().call_group("GUI", "update_gui")	
#	
#	$Need.wait_time = 3 + randi() % 3
#	$Need.start()

	pass

func _on_Bath_pressed():
	if need_now == needs.bath and is_pleased == false:
		GameState.Happines+=10
		GameState.Health+=10
		get_tree().call_group("GUI", "update_gui")
		need_now = needs.none
		is_pleased = true	
		$UI/Control/Actions/SFX/Button2.play()
		need_text()


func _on_Button_pressed():
	GameState.day = !GameState.day
	if GameState.day:
		$Background.frame = 0
		GameState.days_passed+=1
		GameState.pet_days+=1
		get_tree().call_group("GUI", "update_gui")
		$PlayerPet.speed_scale = 1
	if not GameState.day:
		$Background.frame = 1
		$PlayerPet.speed_scale = .5
	#$Timer.start()
	set_anim()
	#first check if negleted, them udpdate the need
	neglected()
	needs()
	$UI/Control/Actions/SFX/Button1.play()


func neglected():
	if not is_pleased:
		print("n deu =( ")
		match need_now:
			0:
				GameState.Health -= 10
				GameState.Happines -= 10
			1:
				GameState.Health -= 10
				GameState.Happines -= 10
			2:
				GameState.Happines -= 10
			_:
				pass
	get_tree().call_group("GUI", "update_gui")
	
	
func needs():
	print("começou")
	var next_need = randi() % 3
	need_now = next_need
	is_pleased = false
	need_text()
