extends Node
var gameInProgress = true
var speedVariable = 1

func _ready() -> void:
	while (gameInProgress):
		await get_tree().create_timer(2).timeout
		speedVariable += 0.25
