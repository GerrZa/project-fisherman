#w_move
extends State

@onready var plr = owner as Player

func _ready() -> void:
	fsm = get_parent()
	plr = owner

func start(msg:={}):
	pass

func physics_process(dt):
	plr.velocity = lerp(plr.velocity, plr.w_input * plr.w_spd, plr.w_lerp)
	
	plr.move_and_slide()

func process(dt):
	if plr.input == Vector2.ZERO:
		fsm.tran("w_idle")

func exit(msg:={}):
	pass
