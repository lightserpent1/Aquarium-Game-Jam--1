extends Node2D

var Chronocut = preload("res://powerup/Chronocut.tscn")
var rng = RandomNumberGenerator.new()

func _ready() -> void:
	spawnPowerup()
	
func spawnPowerup():
	var instance = Chronocut.instantiate()
	instance.position = Vector2(rng.randi_range(100, 800), rng.randi_range(100, 400))
	add_child(instance)
