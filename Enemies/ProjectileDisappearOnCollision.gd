extends Area2D



# Called when the node enters the scene tree for the first time.
func _ready():
	#connect("body_entered", self, "on_Area2D_body_entered")
	self.connect("area_entered", self.on_body_entered)
	var owner = null
	pass

#func _on_body_entered(body):
	#print("collision!")
	#projectile.queue_free()
	#pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func ownerIs(body):
	#print(node)
	owner == body
	#print(owner)
	pass

func on_body_entered(body):
	print("body parent name then my owner:")
	print(body.get_parent().name)
	print(owner.name)
	

	if body.get_parent().has_method("hit") and body.get_parent() != owner:
		body.get_parent().hit()
	#if body.name == "Area2D":
		#get_parent().queue_free()
	#if body.name != "ProjectileArea2D":
		#get_parent().queue_free()
	#get_parent().queue_free()

