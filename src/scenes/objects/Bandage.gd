extends AbstractObject
class_name Bandage

func _ready():
	set_effect(Traits.Effect.KILLING)
	add_trait(Traits.Trait.EMPTY)
	add_trait(Traits.Trait.HOT)

func _check_win_conditions():
	return Traits.Effect.KILLING
