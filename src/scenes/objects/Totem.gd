extends AbstractObject

onready var volcano = get_owner().find_node("Volcano")

func _ready():
	add_trait(Traits.Trait.EMPTY)
	add_trait(Traits.Trait.EMPTY)
	effect = Traits.Effect.DEACTIVATED
	fill_ui_lists()

func _check_win_conditions():
	if traits.has(Traits.Trait.MAGICAL) \
	and traits.has(Traits.Trait.CALM) :
		volcano.stop_erupting()
		make_all_traits_innate()
		return Traits.Effect.SOOTHING
	else:
		return Traits.Effect.DEACTIVATED
