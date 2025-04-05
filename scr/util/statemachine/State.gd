class_name State
extends Node2D

var fsm : StateMachine = null

func _ready() -> void:
	fsm = get_parent()

func start(msg:={}):
	pass

func process(dt):
	pass

func physics_process(dt):
	pass

func exit(msg:={}):
	pass

func _process(delta: float) -> void:
	queue_redraw()
