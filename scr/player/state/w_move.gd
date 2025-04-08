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
	
	var target_rad = plr.get_angle_to(plr.global_position + plr.w_input.rotated(PI/2))
	print("%.2f" % plr.rotation, " | ", "%.2f" % target_rad)
	
	plr.rotation += target_rad * 0.1
	
	plr.move_and_slide()

func process(dt):
	if plr.input == Vector2.ZERO:
		fsm.tran("w_idle")
	
	if Input.is_action_just_pressed("m2"):
		dash()
	

func exit(msg:={}):
	pass

func dash():
	plr.velocity = plr.w_input * plr.w_dash_f
	
