extends AbstractObject
class_name Gold

onready var monkey = get_parent().find_node("Monkey")

func _ready():
	set_effect(Traits.Effect.UNAPPEALING)
	add_trait(Traits.Trait.DIRTY)

func _check_win_conditions():
	if traits.has(Traits.Trait.SHINY):
		monkey.get_to_gold(position)
		return Traits.Effect.APPEALING
	return Traits.Effect.UNAPPEALING
