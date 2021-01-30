extends AbstractObject

func _ready():
	add_trait(Traits.Trait.WET)
	add_trait(Traits.Trait.CALM)
	effect = Traits.Effect.EXTINGUISHED

func _check_win_conditions():
	if get_traits().has(Traits.Trait.HOT) \
	and get_traits().has(Traits.Trait.BRIGHT):
		make_all_traits_innate()
		return Traits.Effect.BURNING
	else:
		return Traits.Effect.EXTINGUISHED
