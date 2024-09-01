extends "res://MoveTowardsPlayer.gd"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	shoot()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass





@onready var projectile = load("res://projectile.tscn")





	



func shoot():
		var instance = projectile.instantiate()
		instance.dir = rotation
		instance.spawnPos = Vector2.ZERO
		instance.spawnRot = rotation
		main.add_child.call_deferred(instance)
