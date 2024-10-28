extends Node2D

var mouse_on = false;
var charged = false
var mouse_x = 0 #get_viewport().get_mouse_position().x;
var mouse_y = 0 #get_viewport().get_mouse_postiion().y;
var guide_x = position.x
var guide_y = position.y 

@onready var guide: Node2D = $guide

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	mouse_x = get_global_mouse_position().x;
	mouse_y = get_global_mouse_position().y;
	
	if (Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and mouse_on):
		charged = true;
	if (charged and not Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT)):
		charged = false
	if (charged):
		guide_x = position.x + (position.x - mouse_x)
		guide_y = position.y + (position.y - mouse_y)
	else:
		guide_x = position.x
		guide_y = position.y
		
	guide.position.x = guide_x
	guide.position.y = guide_y
	pass


func _on_area_2d_mouse_entered() -> void:
	mouse_on = true;
	pass # Replace with function body.


func _on_area_2d_mouse_exited() -> void:
	mouse_on = false;
	pass # Replace with function body.
