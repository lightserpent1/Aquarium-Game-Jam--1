extends Node
var gameInProgress = true
var speedVariable = 1

func _ready() -> void:
	while (gameInProgress):
		await get_tree().create_timer(0.5).timeout
		speedVariable += 1
