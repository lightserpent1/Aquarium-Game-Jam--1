extends Label

var time_elapsed = 0.0
var is_stopped = false
# Called when the node enters the scene tree for the first time.

func reset() -> void:
	# possibly save time_elapsed somewhere else before overriding it
	time_elapsed = 0.0
	is_stopped = false	

func stop() -> void:
	is_stopped = true
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !is_stopped:
		time_elapsed += delta
		text = str(time_elapsed).pad_decimals(2)
