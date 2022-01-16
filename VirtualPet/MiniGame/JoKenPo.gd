extends Node2D

var player_choice
var pet_choice
var winner = false

func _ready():
	$AnimationPlayer.play("Choosing")
	randomize()
	pet_choice = randi () % 3
	print(pet_choice)


func _on_Rock_pressed():
	player_choice = 0
	$CanvasLayer/Control/HBoxContainer/Rock.disabled = true
	$CanvasLayer/Control/HBoxContainer/Paper.disabled = true
	$CanvasLayer/Control/HBoxContainer/Scissors.disabled = true
	_check_result()

func _on_Paper_pressed():
	player_choice = 1
	$CanvasLayer/Control/HBoxContainer/Rock.disabled = true
	$CanvasLayer/Control/HBoxContainer/Paper.disabled = true
	$CanvasLayer/Control/HBoxContainer/Scissors.disabled = true
	_check_result()

func _on_Scissors_pressed():
	player_choice = 2
	$CanvasLayer/Control/HBoxContainer/Rock.disabled = true
	$CanvasLayer/Control/HBoxContainer/Paper.disabled = true
	$CanvasLayer/Control/HBoxContainer/Scissors.disabled = true
	_check_result()
	
func _check_result():
	
	$AnimationPlayer.play("Played")
	yield($AnimationPlayer,"animation_finished")
	if player_choice == pet_choice:
		$CanvasLayer/Control/HBoxContainer/Rock.disabled = false
		$CanvasLayer/Control/HBoxContainer/Paper.disabled = false
		$CanvasLayer/Control/HBoxContainer/Scissors.disabled = false
		randomize()
		pet_choice = randi () % 3	
		$AnimationPlayer.play("Choosing")
	else:
		if player_choice == 0:
			if pet_choice == 1:
					winner  = false
					$PetOwner.play("Rock")
					$Pet.play("Paper")
					call_winner()
					
			if pet_choice == 2:
					winner = true
					$PetOwner.play("Rock")
					$Pet.play("Scisor")
					call_winner()
			
		if player_choice == 1:
			if pet_choice == 0:
					winner  = true
					$PetOwner.play("Paper")
					$Pet.play("Rock")
					call_winner()
			if pet_choice == 2:
					winner = false
					$PetOwner.play("Paper")
					$Pet.play("Scisor")
					call_winner()
		
		if player_choice == 2:
			if pet_choice == 0:
					winner  = false
					$PetOwner.play("Scisor")
					$Pet.play("Rock")
					call_winner()
			if pet_choice == 1:
					winner = true
					$PetOwner.play("Scisor")
					$Pet.play("Paper")
					call_winner()

func call_winner():
	if winner:
		$CanvasLayer/Control/PlayerWinner.text = "You won"
	else:
		$CanvasLayer/Control/PlayerWinner.text = "You lost"
	$Timer.start()


func _on_Timer_timeout():
	get_tree().change_scene("res://Game/MainGame.tscn")
