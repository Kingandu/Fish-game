extends MarginContainer
@onready var play_button: Button = $CenterContainer/HBoxContainer/play
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	play_button.pressed.connect(_on_start_button_pressed)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func _on_start_button_pressed() -> void:
	# Change scene to your combat level
	get_tree().change_scene_to_file("res://scenes/combat.tscn")
