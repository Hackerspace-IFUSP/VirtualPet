extends AnimatedSprite


signal died
signal tired



func _ready():
	pass

func died():
	$DeathTimer.start()
	if GameState.Happines > 0:
		play("good_ghost")
	else:
		play("bad_ghost")


func _on_DeathTimer_timeout():
	print("acabou")
	get_tree().change_scene("res://Game/Respawn.tscn")
