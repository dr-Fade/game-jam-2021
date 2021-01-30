extends AbstractObject

func _ready():
	innate_traits.append(Traits.Trait.AGGRESSIVE)
	add_trait(Traits.Trait.HOT)

func _check_win_conditions():
	if (traits + innate_traits).has(Traits.Trait.AGGRESSIVE):
		return Traits.Effect.ERUPTING
	else:
		return Traits.Effect.SLEEPING
