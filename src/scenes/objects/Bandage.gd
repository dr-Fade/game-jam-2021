extends AbstractObject
class_name Bandage

func _ready():
	set_effect(Traits.Effect.KILLING)
	add_trait(Traits.Trait.GRAY)
	add_trait(Traits.Trait.NASTY)

func _check_win_conditions():
	return Traits.Effect.WOODING
