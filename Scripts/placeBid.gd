extends MarginContainer




@onready var scroll_container: ScrollContainer = $menumargC/HBoxContainer/MarginContainer2/ColorRect/MarginContainer/VBoxContainer/MarginPickPlayer/HBoxContainer/ScrollContainer



@onready var prices := [
	$menumargC/HBoxContainer/MarginContainer2/ColorRect/MarginContainer/VBoxContainer/MarginPickPlayer/HBoxContainer/ScrollContainer/MarginContainer/HBoxContainer/label,
	$menumargC/HBoxContainer/MarginContainer2/ColorRect/MarginContainer/VBoxContainer/MarginPickPlayer/HBoxContainer/ScrollContainer/MarginContainer/HBoxContainer/label2
]

var current_index := 0

func _on_button_right_pressed() -> void:
	if current_index < prices.size() - 1:
		current_index += 1
		_scroll_to_texture(current_index)

func _on_button_left_pressed() -> void:
	if current_index > 0:
		current_index -= 1
		_scroll_to_texture(current_index)

func _scroll_to_texture(index: int):
	var priceLabel = prices[index]
	var offset = priceLabel.global_position.x - scroll_container.global_position.x
	var tween = get_tree().create_tween()
	tween.tween_property(scroll_container, "scroll_horizontal", offset, 0.3)
