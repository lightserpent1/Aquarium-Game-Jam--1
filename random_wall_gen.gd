extends Node2D

var wall_array = []
var wall = preload("res://wall.tscn")
var rng = RandomNumberGenerator.new()
var neverEnd = true
# Called when the node enters the scene tree for the first time.

func randX():
	return(rng.randi_range(-700, 700))
	
func randY():
	return(rng.randi_range(-300, 300))
	
# Generates a random time between 1 and 3 seconds
func randomBreakTimer():
	return rng.randi_range(1, 3)

# Called when the node is added to the scene
func _ready() -> void:
	# Spawn a random number of walls
	spawnWalls()
	# Start deleting walls after spawning
	deleteWalls()
	while (neverEnd == true):
		await get_tree().create_timer(10).timeout
		spawnWalls()
		deleteWalls()
	
# Spawns a wall at a given position and stores it in an array
func spawnWalls():
	for i in range(0, rng.randi_range(5, 9)):
		var instance = wall.instantiate()
		instance.position = Vector2(randX(), randY())
		wall_array.append(instance)
		add_child(instance)

# Deletes walls with a random delay between each deletion
func deleteWalls():
	for j in wall_array:
		# Wait for a random amount of time before deleting the next wall
		await get_tree().create_timer(1).timeout
		j.queue_free()
	# Clear the array after deleting all the walls
	wall_array.clear()
