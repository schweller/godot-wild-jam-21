extends Control

onready var canvasLayer = $CanvasLayer
onready var transitionLayer = $TransitionLayer
onready var transitionAnimator = $TransitionLayer/ColorRect/Animator

func _ready():
	transitionAnimator.play("Fade In")
	yield(get_tree().create_timer(0.5), "timeout")
	transitionLayer.scale = Vector2(0, 0)
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	var buttons = get_tree().get_nodes_in_group("LevelBtns")
	for button in buttons:
		button.connect("select_level", self, "_on_level_select")

func _on_level_select():
	transitionLayer.scale = Vector2(1, 1)
	transitionAnimator.play("Fade Out")
	yield(get_tree().create_timer(1.0), "timeout")
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/World.tscn")
