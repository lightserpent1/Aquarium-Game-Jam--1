extends Area2D



# Called when the node enters the scene tree for the first time.
func _ready():
	#connect("body_entered", self, "on_Area2D_body_entered")
	self.connect("area_entered", self.on_body_entered)
	pass

#func _on_body_entered(body):
	#print("collision!")
	#projectile.queue_free()
	#pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func on_body_entered(body):
	print(body.name)
	#if body.get_parent().has_method("hit"):
		#body.get_parent.hit()
	#if body.name == "Area2D":
		#get_parent().queue_free()
	#if body.name != "ProjectileArea2D":
		#get_parent().queue_free()
	get_parent().queue_free()

