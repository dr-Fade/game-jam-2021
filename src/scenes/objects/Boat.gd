extends AbstractObject
class_name Boat

onready var quest_check = quest_checks.find_node("BoatCheck")

func _ready():
	set_effect(Traits.Effect.SINKING)
	add_trait(Traits.Trait.ANGRY)
	add_trait(Traits.Trait.HEAVY)

func _check_win_conditions():
	if get_traits().has(Traits.Trait.WOODEN) \
	and get_traits().has(Traits.Trait.LIGHT):
		complete_quest(quest_check)
		return Traits.Effect.FLOATING
	else:
		return Traits.Effect.SINKING
