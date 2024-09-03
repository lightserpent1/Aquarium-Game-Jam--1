extends Node2D

var wall_array = []
var wall = preload("res://wall.tscn")
var powerup
var rng = RandomNumberGenerator.new()
var neverEnd = true
# Called when the node enters the scene tree for the first time.

func randX():
	return(rng.randi_range(-700, 700))
	
func randY():
	return(rng.randi_range(-350, 350))
	
# Called when the node is added to the scene
func _ready() -> void:
	# Spawn a random number of walls
	spawnWalls()
	# Start deleting walls after spawning
	#deleteWalls()
	while (neverEnd == true):
		await get_tree().create_timer(rng.randi_range(1-(Global.speedVariable/100+0.01),3-(Global.speedVariable/100+0.01))).timeout
		spawnWalls()

	
# Spawns a wall at a given position and stores it in an array
func spawnWalls():
	for i in range(0, 1):
		var instance = wall.instantiate()
		instance.position = Vector2(randX(), randY())
		wall_array.append(instance)
		add_child(instance)
