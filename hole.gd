extends Node2D

var rng = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().create_timer(rng.randi_range(3-(Global.speedVariable/100+0.01),5-(Global.speedVariable/100+0.01))).timeout
	queue_free()
