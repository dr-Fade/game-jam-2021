extends AbstractObject
class_name Bandage

func _ready():
	set_effect(Traits.Effect.KILLING)
	add_trait(Traits.Trait.EMPTY)
	add_trait(Traits.Trait.EMPTY)

func _check_win_conditions():
	if !(traits + innate_traits).has(Traits.Trait.SHARP):
		return Traits.Effect.BROKEN
	else:
		return effect
