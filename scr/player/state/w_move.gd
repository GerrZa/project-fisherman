#w_move
extends State

@onready var plr = owner as Player

func _ready() -> void:
	fsm = get_parent()
	plr = owner

func start(msg:={}):
	pass

func physics_process(dt):
	if plr.curr_dash_t <= 0:
		plr.velocity = lerp(plr.velocity, plr.w_input * plr.w_spd, plr.w_lerp)
	
	plr.move_and_slide()
	
	plr.curr_dash_t -= dt

func process(dt):
	#if plr.input == Vector2.ZERO and plr.curr_dash_t <= 0:
		#fsm.tran("w_idle")
	
	if Input.is_action_just_pressed("m2"):
		plr.curr_dash_t = plr.w_dash_t
		dash()

func exit(msg:={}):
	pass

func dash():
	print("dash")
	plr.velocity = plr.w_input * plr.w_dash_f
	
