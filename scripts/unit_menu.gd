extends Control

@onready var grid_container: GridContainer = %GridContainer
@export var button_scene: PackedScene

func _ready() -> void:
	load_cats_from_json()

func load_cats_from_json() -> void:
	if not FileAccess.file_exists("res://data/units.json"):
		return
		
	var file = FileAccess.open("res://data/units.json", FileAccess.READ)
	var json = JSON.new()
	var error = json.parse(file.get_as_text())
	
	if error == OK:
		var data = json.get_data()
		
		for child in grid_container.get_children():
			child.queue_free()
			
		for unit_data in json.data:
			create_button(unit_data)
			print(unit_data)

func create_button(data: Dictionary) -> void:
	var button = button_scene.instantiate() as Button

	var path = data.get("icon_path", "")
	if ResourceLoader.exists(path):
		button.icon = load(path)
	
	button.set_meta("id", data["id"])
	button.set_meta("name", data["name"])
	button.set_meta("cost", data["cost"])
	
	button.pressed.connect(func(): _on_button_clicked(data))
	
	grid_container.add_child(button)

func _on_button_clicked(data: Dictionary) -> void:
	print("Selected unit: ", data["name"])
