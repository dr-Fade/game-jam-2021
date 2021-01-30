extends AbstractObject
class_name Crate

func _ready():
	set_effect(Traits.Effect.FLOATING)
	add_trait(Traits.Trait.WOODEN)

func _check_win_conditions():
	if (traits + innate_traits).has(Traits.Trait.WOODEN) :
		return Traits.Effect.FLOATING
	elif !((traits + innate_traits).has(Traits.Trait.EMPTY)):
		return Traits.Effect.SINKING
	else:
		return null
