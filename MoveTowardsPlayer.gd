extends CharacterBody2D

export var speed = 100
var player_position
var target_position
onready var player = get_parent().get_node("Player")

func _physics_process(delta):

    player_position = player_position
    target_position = (player_position - poisition).normalized()

    if position.distance_to(player_position) > 3:
        move_and_slide(target_position * speed)
        look_at(player_position)