extends CharacterBody2D

class_name PlayerCharacter

const max_speed = 400
const acceleration = 1500
const friction  = 1500

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
