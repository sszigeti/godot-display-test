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
	
	# Updating these doesn't have any effect whatsoever
	ProjectSettings.set("size/width", new_size[0])
	ProjectSettings.set("size/height", new_size[1])
	
	# Updating this has some weird effect that produces video glitches on the right&bottom, but does not resize the viewport
	get_viewport_rect().size = new_size
	
	# Only the application window size changes, but not the resolution
	OS.window_size = new_size


func _on_RichTextLabel_meta_clicked(meta):
	OS.shell_open(meta)
