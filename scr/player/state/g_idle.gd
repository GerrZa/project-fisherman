#g_idle
extends State

@onready var plr = owner as Player

func _ready() -> void:
	fsm = get_parent()
	plr = owner

func start(msg:={}):
	pass

func physics_process(dt):
	plr.velocity.x = 0
	plr.velocity.y = plr.G_GRV
	
	plr.move_and_slide()

func process(dt):
	if plr.input.x != 0:
		fsm.tran("g_walk")
	
	if Input.is_action_just_pressed("space") and plr.grounded:
		fsm.tran("g_air", {"jump":1})
	
	if !plr.grounded:
		fsm.tran("g_air")

func exit(msg:={}):
	pass
