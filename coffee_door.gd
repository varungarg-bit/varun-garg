

#extends Node3D
#
## This keeps track of whether the player is standing inside your yellow OpenZone box
#var player_near_door : bool = false
#
#func _input(event: InputEvent) -> void:
	## Checks if the player is standing inside the zone AND physically pressing the E key
	#if player_near_door and Input.is_key_pressed(KEY_E):
		#open_the_gate()
#
#func _on_open_zone_body_entered(body: Node3D) -> void:
	#if body.name == "player" or body.name == "Player":
		#player_near_door = true
#
#func _on_open_zone_body_exited(body: Node3D) -> void:
	#if body.name == "player" or body.name == "Player":
		#player_near_door = false
#
#func open_the_gate() -> void:
	## Plays your animation track name from the timeline photo
	#$AnimationPlayer.play("new_animation")
	#
	## Disables the physical wall so you can cross the threshold smoothly
	#if has_node("DOOR/StaticBody3D/CollisionShape3D"):
		#$DOOR/StaticBody3D/CollisionShape3D.disabled = true


#extends Node3D
#
#@export var wrong_door: bool = false
#@export var allow_e := true
#
#@onready var open_sound : AudioStreamPlayer3D = $open
#@onready var close_sound : AudioStreamPlayer3D = $close
#@onready var scary = get_node_or_null("scary")
#
#var player_near_door : bool = false
#var is_gate_open : bool = false
#
#func _input(event: InputEvent) -> void:
	## Only allow opening if the player is near and the gate isn't already open
	#if player_near_door and not is_gate_open and allow_e and Input.is_key_pressed(KEY_E):
		#open_and_auto_close_gate()
		#
#
#func _on_open_zone_body_entered(body: Node3D) -> void:
	#if body.name == "player" or body.name == "Player":
		#player_near_door = true
#
#func _on_open_zone_body_exited(body: Node3D) -> void:
	#if body.name == "player" or body.name == "Player":
		#player_near_door = false
#
#func open_and_auto_close_gate() -> void:
	#is_gate_open = true
	#
	## 1. PLAY OPEN ANIMATION
	#open_sound.play()
	#$AnimationPlayer.play("new_animation")
	#
	#if wrong_door and scary != null:
		#await get_tree().create_timer(0.7).timeout
		#scary.play()
	#
	## 2. TURN OFF COLLISION WALL
	#if has_node("DOOR/StaticBody3D/CollisionShape3D"):
		#$DOOR/StaticBody3D/CollisionShape3D.disabled = true
		#
	## 3. WAIT FOR EXACTLY 2 SECONDS
	#await get_tree().create_timer(3.0).timeout
	#
	## 4. PLAY CLOSE ANIMATION (Plays "new_animation" backwards)
	#$AnimationPlayer.play_backwards("new_animation")
	#await get_tree().create_timer(0.9).timeout
	#close_sound.play()
	#
	## 5. TURN COLLISION WALL BACK ON
	#if has_node("DOOR/StaticBody3D/CollisionShape3D"):
		#$DOOR/StaticBody3D/CollisionShape3D.disabled = false
		#
	#is_gate_open = false
