extends AbstractObject
class_name Native

func _ready():
	set_effect(Traits.Effect.WOODING)
	add_trait(Traits.Trait.EMPTY)
	add_trait(Traits.Trait.EMPTY)

func _check_win_conditions():
	if (traits + innate_traits).has(Traits.Trait.SHARP) && (traits + innate_traits).has(Traits.Trait.WOODEN):
		return Traits.Effect.BROKEN
	elif (traits + innate_traits).has(Traits.Trait.SHARP) && (traits + innate_traits).has(Traits.Trait.HOT):
		return Traits.Effect.KILLING
	else:
		return Traits.Effect.KILLING
