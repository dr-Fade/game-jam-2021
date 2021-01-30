extends AbstractObject
class_name Boat

func _ready():
	set_effect(Traits.Effect.SINKING)
	add_trait(Traits.Trait.ANGRY)
	add_trait(Traits.Trait.HEAVY)

func _check_win_conditions():
	if (traits + innate_traits).has(Traits.Trait.WOODEN) && (traits + innate_traits).has(Traits.Trait.LIGHT):
		return Traits.Effect.FLOATING
	elif !((traits + innate_traits).has(Traits.Trait.EMPTY)):
		return Traits.Effect.SINKING
	else:
		return null
