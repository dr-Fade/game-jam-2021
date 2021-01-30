extends AbstractObject

onready var crystals = get_owner().find_node("Crystals")

func _ready():
	innate_traits.append(Traits.Trait.SALTY)
	add_trait(Traits.Trait.DRY)
	effect = Traits.Effect.DRIED
	fill_ui_lists()

func _check_win_conditions():
	if get_traits().has(Traits.Trait.WET):
		crystals.spawn()
		make_all_traits_innate()
		return Traits.Effect.SATURATED
	else:
		return Traits.Effect.DRIED
