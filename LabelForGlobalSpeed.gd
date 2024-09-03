extends Label


# Called when the node enters the scene tree for the first time.
func _process(delta) -> void:
	text = str(Global.speedVariable) + "x"
