extends Node2D

@onready var main = get_tree().get_root().get_node("testarea")
@onready var projectile = load("res://projectile.tscn")
var attack_started = false;


func _ready():
	shoot()

func shoot():
	var instance = projectile.instantiate()
	instance.dir = rotation
	instance.spawnPos = global_position
	instance.spawnRot = global_rotation
	main.add_child.call_deferred(instance)

func _process(delta):
	if attack_started:
		print("not attacking")
		return
	else:
		attack_started = true
		await get_tree().create_timer(0.5).timeout
		shoot()
		attack_started = false







