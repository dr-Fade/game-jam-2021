extends Node2D
class_name Quest

var Quest1Complete = false
var Quest2Complete = false
var Quest3Complete = false


# Called when the node enters the scene tree for the first time.
func _ready():
	$Check1.visible = Quest1Complete
	$Check2.visible = Quest2Complete
	$Check3.visible = Quest3Complete

func QuestOneComplete():
	Quest1Complete = true
	$Check1.visible = Quest1Complete

func QuestTwoComplete():
	Quest2Complete = true
	$Check2.visible = Quest2Complete

func QuestThreeComplete():
	Quest3Complete = true
	$Check3.visible = Quest3Complete	

