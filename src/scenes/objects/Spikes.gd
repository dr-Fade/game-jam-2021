extends AbstractObject
class_name Spikes

func _ready():
	set_effect(Traits.Effect.KILLING)
	add_trait(Traits.Trait.SHARP)
	add_trait(Traits.Trait.HOT)

func _check_win_conditions():
	if (traits + innate_traits).has(Traits.Trait.SHARP) && (traits + innate_traits).has(Traits.Trait.WOODEN):
		return Traits.Effect.BROKEN
	elif (traits + innate_traits).has(Traits.Trait.SHARP) && (traits + innate_traits).has(Traits.Trait.HOT):
		return Traits.Effect.KILLING
	else:
		return null
