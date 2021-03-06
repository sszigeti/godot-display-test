extends MarginContainer

onready var fullscreen = $VBoxContainer/HBoxContainer/CheckButton
onready var resolutions = $VBoxContainer/HBoxContainer/ItemList


func _ready():
	fullscreen.pressed = OS.window_fullscreen


func _on_CheckButton_toggled(button_pressed):
	OS.window_fullscreen = button_pressed


func _on_ItemList_item_selected(index):
	var requested_resolution = resolutions.get_item_text(index).split_floats(",")
	var new_size = Vector2(requested_resolution[0], requested_resolution[1])
	
	get_tree().set_screen_stretch(SceneTree.STRETCH_MODE_VIEWPORT, SceneTree.STRETCH_ASPECT_KEEP, new_size)
	
	if !OS.window_fullscreen:
		OS.window_size = new_size


func _on_RichTextLabel_meta_clicked(meta):
	OS.shell_open(meta)
