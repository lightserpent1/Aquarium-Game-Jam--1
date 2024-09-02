extends CharacterBody2D

@onready var main = get_tree().get_root().get_node("testarea")
@onready var projectile = load("res://projectile.tscn")
var attack_started = false;

@onready var navigation_agent: NavigationAgent2D = $NavigationAgent2D
@export var target_to_chase: CharacterBody2D

const SPEED = 300





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



func _physics_process(delta: float) -> void:
	look_at(target_to_chase.position)
	navigation_agent.target_position = target_to_chase.global_position
	velocity = global_position.direction_to(navigation_agent.get_next_path_position()) * SPEED
	move_and_slide()



