extends AbstractObject
class_name Flower

func _ready():
	set_effect(Traits.Effect.ROATING)
	add_trait(Traits.Trait.EMPTY)
	add_trait(Traits.Trait.EMPTY)

func _check_win_conditions():
	if traits.has(Traits.Trait.NASTY):
		return Traits.Effect.ROATING
	return Traits.Effect.BLOOMING
