extends AbstractObject
class_name Fly

func _ready():
	
	set_effect(Traits.Effect.BLOOMING)
	add_trait(Traits.Trait.EMPTY)
	add_trait(Traits.Trait.EMPTY)

func _check_win_conditions():
	return Traits.Effect.BLOOMING
