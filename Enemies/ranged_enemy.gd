extends CharacterBody2D

#health system
const MAX_HEALTH = 5
var health = MAX_HEALTH
var projectile_spawn_distance_from_creator = 40




@onready var main = get_tree().get_root().get_node("testarea")
@onready var projectile = load("res://Enemies/projectile.tscn")
var attack_started = false;

@onready var navigation_agent: NavigationAgent2D = $NavigationAgent2D
@export var target_to_chase: CharacterBody2D

const SPEED = 300

func _ready():
	#shoot()
	set_health_label()
	$HealthBar.max_value = MAX_HEALTH
	set_health_bar()
	
	
	
func shoot():
	#var x_facing = self.transform
	#var y_facing = self.transform.y
	#var facing = Vector2()
	#facing = x_facing + y_facing
	var projectileSpawnPos = global_position
	var spawn_vec = Vector2(projectile_spawn_distance_from_creator,0).rotated(rotation)
	projectileSpawnPos += spawn_vec
	
	var instance = projectile.instantiate()
	instance.dir = rotation
	instance.spawnPos = projectileSpawnPos
	instance.spawnRot = global_rotation
	#main.add_child.call_deferred(instance)
	instance.get_node("ProjectileArea2D").ownerIs(self)
	main.add_child.call_deferred(instance)

func _process(delta):
	if attack_started:
	#	print("not attacking")
		return
	else:
		attack_started = true
		await get_tree().create_timer(randf_range(0.25, 0.5)).timeout
		shoot()
		attack_started = false

func _physics_process(delta: float) -> void:
	look_at(target_to_chase.position)
	if position.distance_to(target_to_chase.position) > 150:
		navigation_agent.target_position = target_to_chase.global_position
		velocity = global_position.direction_to(navigation_agent.get_next_path_position()) * SPEED
		move_and_slide()

func set_health_label() -> void:
	$HealthLabel.text = "Health: %s" % health

func set_health_bar() -> void:
	$HealthBar.value = health

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		damage()

func damage() -> void:
	health -= 1
	if health < 0:
		queue_free()
		health = MAX_HEALTH
	set_health_label()
	set_health_bar()

func hit():
	damage()
