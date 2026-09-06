extends Node3D
@onready var label = $CSGCombiner3D/CSGBox3D13/Label3D
@onready var label2 = $CSGCombiner3D/CSGBox3D13/Label3D2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label.visible = false
	label2.visible = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	if Input.is_key_pressed(KEY_E):
		label.visible = true
		label2.visible = false
	elif Input.is_key_pressed(KEY_X):
		label.visible = false
		
