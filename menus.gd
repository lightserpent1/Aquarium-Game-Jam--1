extends Control


# starts the game
func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://testarea.tscn")
func _on_reset_pressed() -> void:
	get_tree().change_scene_to_file("res://testarea.tscn")
func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_options_pressed() -> void:
	pass # Replace with function body.
