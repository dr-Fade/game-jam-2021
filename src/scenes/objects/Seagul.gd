extends AbstractObject
class_name Seagul

onready var feather = get_owner().find_node("Feather")

func _ready():
	innate_traits.append(Traits.Trait.NERVOUS)
	set_effect(Traits.Effect.CALMED)

func _check_win_conditions():
	return Traits.Effect.SCARED

func spawn_feather():
	set_effect(Traits.Effect.SCARED)
	feather.spawn()
