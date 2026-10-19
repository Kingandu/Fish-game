extends Sprite2D
var i = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var frameIndex: int = frame
	print(frameIndex)

	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	pass
func _on_timer_timeout() -> void:
	frame += int(1)
	if frame >= hframes-1:
		frame = 0
		print("reset")
	pass
