extends Node


var pet_life = 0 setget set_number, get_number
var pet_name : String = "" setget set_name, get_name
var day = true setget set_day, get_day
var days_passed = 1 setget set_days, get_days

enum type {GREEN, BLUE, PINK, CREAM}
enum age {BABY, CHILD, ADULT}

var pet_age = age.BABY setget ,get_age
var pet_type = type.PINK

var Health = 100 setget set_health, get_health
var Happines = 50 setget set_happines, get_happines
var Energy = 100 setget set_energy, get_energy

signal died
signal tired


func set_health(health):
	Health = health
	if Health <= 0:
		emit_signal("died")
		
func get_health():
	return Health
	
func set_happines(happines):
	Happines = happines
	if Happines <= 0:
		emit_signal("died")
		

func get_happines():
	return Happines
	
func set_energy(energy):
	Energy = clamp(energy,0,100)
	if Energy <= 0:
		emit_signal("tired")
	
		

func get_energy():
	return Energy


func set_days(days):
	days_passed = days

func get_days():
	return days_passed	
	
func set_day(setday):
	day = setday

func get_day():
	return day

func get_age():
	match pet_age:
		0:
			return "baby"
		1: 
			return "child"
		2: 
			return "adult"
			
func set_number(number):
	pet_life = number
	
func get_number():
	return pet_life
	
func set_name(name):
	pet_name = name
	
func get_name():
	return pet_name
