extends AbstractObject
class_name Flower

onready var fly = get_parent().find_node("Fly")

func _ready():
	set_effect(Traits.Effect.ROTTING)
	add_trait(Traits.Trait.EMPTY)

func _check_win_conditions():
	if traits.has(Traits.Trait.NASTY):
		fly.spawn()
		make_all_traits_innate()
		return Traits.Effect.ROTTING
	return Traits.Effect.BLOOMING
