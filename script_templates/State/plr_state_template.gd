#PLR TEMPLATE
extends State

@onready var plr = owner as Player

func _ready() -> void:
	fsm = get_parent()
	plr = owner

func start(msg:={}):
	pass

func physics_process(dt):
	pass

func process(dt):
	pass

func exit(msg:={}):
	pass
