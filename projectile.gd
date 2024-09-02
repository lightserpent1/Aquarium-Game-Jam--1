extends CharacterBody2D

@export var SPEED = 500

var dir : float
var spawnPos : Vector2
var spawnRot: float

func _ready():
	global_position = spawnPos
	global_rotation = spawnRot

func _physics_process(delta: float) -> void:
	velocity = Vector2(0,-SPEED).rotated(dir + 89.5)
	move_and_slide()
