extends Control

onready var start_button = $Background/VBoxContainer/CenterContainer/Start

func _ready():
	yield(get_tree(),"idle_frame")
	start_button.rect_scale = Vector2(3,3)
	
	

func _on_Start_mouse_entered():
	start_button.rect_scale = Vector2(5,5)
	$AnimationPlayer.play("shake")
	
	

func _on_Start_mouse_exited():
	start_button.rect_scale = Vector2(3,3)
	$AnimationPlayer.stop()
#	$Tween.interpolate_property(start_button.texture_normal,"fps",100,4,3,Tween.TRANS_CUBIC,Tween.EASE_IN)
#	$Tween.interpolate_property(start_button,"rect_rotation",start_button.rect_rotation,0,.5,Tween.TRANS_CUBIC,Tween.EASE_IN)
#	$Tween.start()

func _on_Start_pressed():
	$Popup.popup_centered()
