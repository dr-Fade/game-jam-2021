extends AbstractObject
class_name Bandage

func _ready():
	set_effect(Traits.Effect.KILLING)
	add_trait(Traits.Trait.GRAY)
	add_trait(Traits.Trait.NASTY)

func _check_win_conditions():
	if (traits + innate_traits).has(Traits.Trait.COTTON) && (traits + innate_traits).has(Traits.Trait.STICKY):
		get_parent().find_node("Native").set_effect(Traits.Effect.HEALING)
		return Traits.Effect.HEALING
	return Traits.Effect.WOUNDING
