class_name StateMachine
extends Node2D

@export var init_state : NodePath
var state : State = null

var plr_ready = false

func _ready() -> void:
	await owner.ready
	plr_ready = true
	
	state = get_node(init_state)
	state.start()

func _process(delta: float) -> void:
	print(state.name)
	queue_redraw()
	if plr_ready:
		state.process(delta)

func _physics_process(delta: float) -> void:
	if plr_ready:
		state.physics_process(delta)

func tran(to_state : String, msg:={}):
	state.exit(msg)
	state = get_node(to_state)
	state.start(msg)
