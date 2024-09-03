extends Area2D

var projectile = get_parent()

# Called when the node enters the scene tree for the first time.
func _ready():
	#connect("body_entered", self, "on_Area2D_body_entered")
	#connect("area_entered", self.on_Area2D_body_entered)
	pass

#func _on_body_entered(body):
	#print("collision!")
	#projectile.queue_free()
	#pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func on_Area2D_body_entered(body):
	print("body entered")
	if body.has_method("hit"):
		body.hit()
	projectile.queue_free()
	

