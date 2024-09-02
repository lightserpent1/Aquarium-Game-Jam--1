extends Node2D

var wall_array = []
var wall = preload("res://wall.tscn")
var rng = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.

func randX():
	return(rng.randi_range(-600, 600))
	
func randY():
	return(rng.randi_range(-300, 300))
	
# Generates a random time between 3 and 6 seconds
func randomBreakTimer():
	return rng.randi_range(3, 4)

# Called when the node is added to the scene
func _ready() -> void:
	# Spawn a random number of walls
	for i in range(0, rng.randi_range(5, 9)):
		spawnWalls(Vector2(randX(), randY()))
	
	# Start deleting walls after spawning
	deleteWalls()

# Spawns a wall at a given position and stores it in an array
func spawnWalls(pos):
	var instance = wall.instantiate()
	instance.position = pos
	wall_array.append(instance)
	add_child(instance)

# Deletes walls with a random delay between each deletion
func deleteWalls():
	for j in wall_array:
		# Wait for a random amount of time before deleting the next wall
		await get_tree().create_timer(randomBreakTimer()).timeout
		j.queue_free()
	
	# Clear the array after deleting all the walls
	wall_array.clear()
