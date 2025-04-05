class_name Player
extends CharacterBody2D

var input = Vector2.ZERO
var w_input = Vector2.ZERO

#Movement Variable
const G_GRV = 10
const G_SPD = 70
const J_FORCE = 200
const W_GRV = 2
var w_lerp = 0.05
var w_spd = 40

var grounded = false

@onready var map = get_tree().current_scene

func _process(delta: float) -> void:
	#update var
	grounded = $g_check.get_overlapping_bodies().size() > 0
	input.x = Input.get_axis("left","right")
	input.y = Input.get_axis("up","down")
	w_input = input.normalized()
	
	#print($StateMachine.state.name)
	
	#multi state transition
	if global_position.y > map.water_level:
		$StateMachine.tran("w_idle")
