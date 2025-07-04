extends MarginContainer


#@export var storyB: Button
#@export var quickmatchB: Button
#@export var onlinemultiplayerB: Button
#@export var friendliesB: Button
#@export var superballleagueB: Button
#@export var eventsB: Button
#var in_menu_buttons: Array

# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#in_menu_buttons = [storyB, quickmatchB, onlinemultiplayerB, friendliesB, superballleagueB, eventsB] # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#update_button_scale()
	#set_deferred("scroll_horizontal", 600)
	
##func update_button_scale():
	##for button in in_menu_buttons:
		##button_hov(button, 1.3, 0.2)
		
#func button_hov(button: Button, tween_amt, duration):
	#button.pivot_offset = button.size / 2
	#if button.is_hovered():
		#tween(button, "scale", Vector2.ONE * tween_amt, duration)
		#button.z_index=5
	#else:
		#tween(button, "scale", Vector2.ONE, duration)
		#button.z_index=0
#
#func tween(button, property, amount, duration):
	#var tween = create_tween()
	#tween.tween_property(button, property, amount, duration)

#func _unhandled_input(event):
	#if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_WHEEL_UP:
		#scroll_container.scroll_horizontal -= 30
	#elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
		#scroll_container.scroll_horizontal += 30


@onready var scroll_container: ScrollContainer = $MarginSelectPlayer/SelectPlayerMargContainer/VBoxContainer/HBoxContainer/MarginPickPlayer/HBoxContainer/ScrollContainer

#func _on_button_left_pressed() -> void:
	#scroll_container.scroll_horizontal -= 1000 
#
#
#func _on_button_right_pressed() -> void:
	#scroll_container.scroll_horizontal += 1000 

@onready var texture_rects := [
	$MarginSelectPlayer/SelectPlayerMargContainer/VBoxContainer/HBoxContainer/MarginPickPlayer/HBoxContainer/ScrollContainer/MarginContainer/HBoxContainer/TextureRect,
	$MarginSelectPlayer/SelectPlayerMargContainer/VBoxContainer/HBoxContainer/MarginPickPlayer/HBoxContainer/ScrollContainer/MarginContainer/HBoxContainer/TextureRect2
]

var current_index := 0

func _on_button_right_pressed() -> void:
	if current_index < texture_rects.size() - 1:
		current_index += 1
		_scroll_to_texture(current_index)

func _on_button_left_pressed() -> void:
	if current_index > 0:
		current_index -= 1
		_scroll_to_texture(current_index)

func _scroll_to_texture(index: int):
	var texture = texture_rects[index]
	var offset = texture.global_position.x - scroll_container.global_position.x
	var tween = get_tree().create_tween()
	tween.tween_property(scroll_container, "scroll_horizontal", offset, 0.3)
