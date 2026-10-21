extends Node2D
var unit_name = "fih"
const SAVE_PATH := "res://data/units.json"

func load_json():
	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
	var text = file.get_as_text()
	file.close()

	var result = JSON.parse_string(text)
	return result
func _ready() -> void:
	var result = load_json()
	# array to check, key to find, value to find
	print(find_dict_by_key_value(result, "id", 0))
	pass
func find_dict_by_key_value(array: Array, key: String, value) -> Dictionary:
	for dict_item in array:
		if typeof(dict_item) == TYPE_DICTIONARY and dict_item.has(key):
			if dict_item[key] == value:
				return dict_item
	return {}
func _process(delta: float) -> void:
	pass
func spawn_unit(delta: float) -> void:
	pass
