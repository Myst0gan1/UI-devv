extends MarginContainer

@onready var scroll_container_2 := [
	$MarginSelectPlayer/SelectPlayerMargContainer/VBoxContainer/HBoxContainer/MarginPickPlayer/HBoxContainer/ScrollContainer2,
	$MarginSelectPlayer/SelectPlayerMargContainer/VBoxContainer/HBoxContainer2/MarginPickPlayer/HBoxContainer/ScrollContainer2,
	$MarginSelectPlayer/SelectPlayerMargContainer/VBoxContainer/HBoxContainer3/MarginPickPlayer/HBoxContainer/ScrollContainer2
]

# Labels for each scroll group
@onready var difficulty_labels := [
	scroll_container_2[0].get_node("MarginContainer/HBoxContainer/label"),
	scroll_container_2[0].get_node("MarginContainer/HBoxContainer/label2")
]

@onready var timeofday_labels := [
	scroll_container_2[1].get_node("MarginContainer/HBoxContainer/label"),
	scroll_container_2[1].get_node("MarginContainer/HBoxContainer/label2")
]

@onready var selectside_labels := [
	scroll_container_2[2].get_node("MarginContainer/HBoxContainer/label"),
	scroll_container_2[2].get_node("MarginContainer/HBoxContainer/label2")
]

# Store current index for each group
var sections := [
	{
		"scroll": null,
		"labels": [],
		"index": 0
	},
	{
		"scroll": null,
		"labels": [],
		"index": 0
	},
	{
		"scroll": null,
		"labels": [],
		"index": 0
	}
]

func _ready():
	# Set up sections now that scrolls and labels are ready
	sections[0]["scroll"] = scroll_container_2[0]
	sections[0]["labels"] = difficulty_labels

	sections[1]["scroll"] = scroll_container_2[1]
	sections[1]["labels"] = timeofday_labels

	sections[2]["scroll"] = scroll_container_2[2]
	sections[2]["labels"] = selectside_labels

# Call this from each button
func scroll_section(section_index: int, direction: int):
	var section = sections[section_index]
	section["index"] += direction
	section["index"] = clamp(section["index"], 0, section["labels"].size() - 1)

	var label = section["labels"][section["index"]]
	var scroll = section["scroll"]
	var offset = label.global_position.x - scroll.global_position.x

	var tween = get_tree().create_tween()
	tween.tween_property(scroll, "scroll_horizontal", offset, 0.3)

func _on_button_right_difficulty_pressed():
	scroll_section(0, 1)

func _on_button_left_difficulty_pressed():
	scroll_section(0, -1)

func _on_button_right_time_pressed():
	scroll_section(1, 1)

func _on_button_left_time_pressed():
	scroll_section(1, -1)

func _on_button_right_side_pressed():
	scroll_section(2, 1)

func _on_button_left_side_pressed():
	scroll_section(2, -1)
