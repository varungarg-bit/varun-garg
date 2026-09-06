extends CharacterBody3D
#@onready var audio_sound : AudioStreamPlayer3D = $"../SCARY/AUDIO"

const SPEED = 8

const JUMP_VELOCITY = 5
var MOUSE_SENSITIVITY = 0.003
var near_lamp : bool = false


@onready var camera = $Camera3D

func _ready():
# Captures the mouse cursor inside the game window
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _unhandled_input(event):
# Rotates the camera and player body using mouse movement
	if event is InputEventMouseMotion:
		rotate_y(-event.relative.x * MOUSE_SENSITIVITY)
		camera.rotate_x(-event.relative.y * MOUSE_SENSITIVITY)
		camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-80), deg_to_rad(80))

func _physics_process(delta):
# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

#if global_position.y < -10:
#get_tree().reload_current_scene()

# Get the input direction and handle the movement/deceleration.
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction = (transform.basis * Vector3(input_dir.x, 0,
input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()

#func _input(event: InputEvent) -> void:
## 1. Look for the Q key press
#if Input.is_key_pressed(KEY_Q):
## 2. Look into the current active level map to see if a Lantern exists nearby
#var current_level = get_tree().current_scene
## 2. Look into the current active level map to see if the lamp folder exists
#if current_level.has_node("lamp/Lantern"):
#var lantern_node = current_level.get_node("lamp/Lantern")


# 3. Calculate distance between the player's position and the lamp
#var distance = global_position.distance_to(lantern_node.global_position)

# 4. If within 3 meters, turn off the light components instantly!
#if distance < 3.0:
#if lantern_node.has_node("OmniLight3D2"):
#lantern_node.get_node("OmniLight3D2").visible = false
#if lantern_node.has_node("Label3D"):
#lantern_node.get_node("Label3D").visible = false

#if event is InputEventKey and event.pressed and event.keycode == KEY_TAB:
#if has_node("menu"):
#get_node("menu").queue_free() # Close it if open
#Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
#else:
## Pluck the menu directly out of your end scene file
#var m = load("res://TSCN file/END.tscn").instantiate().get_node("menu")
#m.get_parent().remove_child(m)
#add_child(m) # Add it to the screen
#Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
#
