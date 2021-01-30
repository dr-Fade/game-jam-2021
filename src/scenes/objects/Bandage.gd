extends AbstractObject
class_name Bandage

onready var quest_check = quest_checks.find_node("NativeCheck")
onready var native = get_parent().find_node("Native")

func _ready():
	set_effect(Traits.Effect.KILLING)
	add_trait(Traits.Trait.GRAY)
	add_trait(Traits.Trait.NASTY)

func _check_win_conditions():
	if get_traits().has(Traits.Trait.COTTON) \
	and get_traits().has(Traits.Trait.STICKY):
		native.set_effect(Traits.Effect.HEALING)
		complete_quest(quest_check)
		return Traits.Effect.HEALING
	return Traits.Effect.WOUNDING
