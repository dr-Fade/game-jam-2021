extends AbstractObject
class_name Mask

func _ready():
	set_effect(Traits.Effect.AMUSING)
	add_trait(Traits.Trait.METALLIC)

func _check_win_conditions():
	if (traits + innate_traits).has(Traits.Trait.ANGRY) :
		return Traits.Effect.HORRIFIYNG
	elif !((traits + innate_traits).has(Traits.Trait.EMPTY)):
		return Traits.Effect.AMUSING
	else:
		return null

