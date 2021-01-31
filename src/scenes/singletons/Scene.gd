extends Node
class_name Scene

onready var player = $ObjectPool/Player
onready var quest_overlay = $ObjectPool/Player/Quest
var quit_label = "Quit"

func _ready():
	player.acceps_inputs = false
	hide_quests()

func _on_PlayButton_pressed():
	if $MenuCanvas/Menu/Button.text == quit_label:
		get_tree().quit()
	show_quests()
	$MenuCanvas/Menu.visible = false
	player.acceps_inputs = true

func win():
	hide_quests()
	player.acceps_inputs = false
	$MenuCanvas/Menu/Button.text = quit_label
	$MenuCanvas/Menu/WinLabel.visible = true
	$MenuCanvas/Menu.visible = true

func show_quests():
	for node in quest_overlay.get_children():
		node.visible = true
	$ObjectPool/Player/Quest/NativeCheck.visible = false
	$ObjectPool/Player/Quest/BonfireCheck.visible = false
	$ObjectPool/Player/Quest/BoatCheck.visible = false

func hide_quests():
	for node in quest_overlay.get_children():
		node.visible = false
