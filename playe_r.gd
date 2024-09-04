extends CharacterBody2D

class_name PlayerCharacter

const max_speed = 400
const acceleration = 1500
const friction  = 1500
#health system
const MAX_HEALTH = 5
var health = MAX_HEALTH


func _ready():
	#health system setup
	set_health_label()
	$HealthBar.max_value = MAX_HEALTH
	set_health_bar()


func player_movement(input, delta):

	if input: velocity = velocity.move_toward(input * max_speed * Global.speedVariable, delta * acceleration* Global.speedVariable)

	else: velocity = velocity.move_toward(Vector2(0,0), delta * friction * Global.speedVariable)


func _physics_process(delta):
	var input = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	player_movement(input, delta)
	move_and_slide()


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("power"):
		print("test")


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
