class_name Player
extends CharacterBody2D

var input = Vector2.ZERO
var w_input = Vector2.ZERO

#NOTE
#Every level-based variable will be init as level 1 and be loaded when i impliment level system

#Movement Variable
const G_GRV = 10
const G_SPD = 70
const G_XLERP = 0.2
const A_XLERP = 0.2 #on-air lerp
const J_FORCE = 200
const W_GRV = 2
var w_lerp = 0.08
const W_DEF_SPD = 75
var w_spd = 0
var w_dash_f = 400

#Oxygen / stamina
var ox_max = 100
var curr_ox = 0

var grounded = false

@onready var map = get_tree().current_scene

func _ready() -> void:
	#init var
	load_data()
	var_setup()

func _process(delta: float) -> void:
	#update var
	grounded = $g_check.get_overlapping_bodies().size() > 0
	input.x = Input.get_axis("left","right")
	input.y = Input.get_axis("up","down")
	w_input = input.normalized()
	
	#multi state transition
	if global_position.y > map.water_level and String($StateMachine.state.name)[0] == "g":
		$StateMachine.tran("w_idle")
	elif global_position.y <= map.water_level and String($StateMachine.state.name)[0] == "w":
		if grounded:
			if input != Vector2.ZERO:
				$StateMachine.tran("g_walk")
			else:
				$StateMachine.tran("g_idle")
		else:
			$StateMachine.tran("g_air")
	
	#state ground action
	if String($StateMachine.state.name)[0] == "g":
		rotation = lerp(rotation, 0.0, 0.5)
	
	if input.x < 0:
		$spr.flip_h = true
	elif input.x > 0:
			$spr.flip_h = false
	

func var_setup():
	curr_ox = ox_max
	w_spd = W_DEF_SPD

func load_data():
	pass
