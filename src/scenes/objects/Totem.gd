extends AbstractObject

onready var volcano = get_owner().find_node("Volcano")

func _ready():
	innate_traits.append(Traits.Trait.CALM)
	traits.append(Traits.Trait.EMPTY)
	fill_ui_lists()

func _check_win_conditions():
	if traits.has(Traits.Trait.MAGICAL):
		volcano.stop_erupting()
		innate_traits += traits
		traits.clear()
		fill_ui_lists()
		return Traits.Effect.SOOTHING
	else:
		return null
