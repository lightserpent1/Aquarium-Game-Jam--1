extends CharacterBody2D

class_name PlayerCharacter

const max_speed = 400
const acceleration = 1500
const friction  = 600

func player_movement(input, delta):

	if input: velocity = velocity.move_toward(input * max_speed , delta * acceleration)

	else: velocity = velocity.move_toward(Vector2(0,0), delta * friction)


func _physics_process(delta):

	var input = Input.get_vector("ui_left","ui_right","ui_up","ui_down")

	player_movement(input, delta)

	move_and_slide()
