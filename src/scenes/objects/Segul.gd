extends AbstractObject
class_name Segul


func _ready():
	innate_traits.append(Traits.Trait.NERVOUS)
	set_effect(Traits.Effect.CALMED)
	fill_ui_lists()

func _check_win_conditions():
	return Traits.Effect.CALMED
