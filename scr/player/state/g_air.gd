#g_air
extends State

@onready var plr = owner as Player

func _ready() -> void:
	fsm = get_parent()
	plr = owner

func start(msg:={}):
	if msg.has("jump"):
		plr.velocity.y = -plr.J_FORCE

func physics_process(dt):
	plr.velocity.x = plr.input.x * plr.G_SPD
	plr.velocity.y += plr.G_GRV
	
	plr.move_and_slide()

func process(dt):
	if plr.grounded and plr.velocity.y >= 0:
		if plr.input.x != 0:
			fsm.tran("g_walk")
		else:
			fsm.tran("g_idle")

func exit(msg:={}):
	pass
