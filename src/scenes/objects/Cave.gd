extends AbstractObject

onready var crystals = get_owner().find_node("Crystals")

var crystal_produced = false

func _ready():
	innate_traits.append(Traits.Trait.SALTY)
	add_trait(Traits.Trait.DRY)
	fill_ui_lists()

func _check_win_conditions():
	if get_traits().has(Traits.Trait.WET):
		if !crystal_produced:
			crystals.show_up()
			innate_traits += traits
			traits.clear()
			fill_ui_lists()
			crystal_produced = true
			$TraitUiOpener/CollisionShape2D.disabled = true
		return Traits.Effect.SATURATED
	else:
		return null
