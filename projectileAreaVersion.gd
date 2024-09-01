extends Area2D


var velocity: Vector2 = VEctor2()



func _ready() -> void:
	connect("body_entered", self, "_on_body_entered")
	
