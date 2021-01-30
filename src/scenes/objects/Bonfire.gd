extends AbstractObject
class_name Bonfire

onready var quest_check = quest_checks.find_node("BonfireCheck")

func _ready():
	add_trait(Traits.Trait.WET)
	add_trait(Traits.Trait.CALM)
	effect = Traits.Effect.EXTINGUISHED

func _check_win_conditions():
	if get_traits().has(Traits.Trait.HOT) \
	and get_traits().has(Traits.Trait.BRIGHT):
		complete_quest(quest_check)
		return Traits.Effect.BURNING
	else:
		return Traits.Effect.EXTINGUISHED
