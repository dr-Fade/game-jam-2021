extends AbstractObject
class_name Gold

func _ready():
	set_effect(Traits.Effect.DARKENED)
	add_trait(Traits.Trait.EMPTY)
	add_trait(Traits.Trait.EMPTY)

func _check_win_conditions():
	if traits.has(Traits.Trait.COLD):
		get_parent().find_node("Monkey").find_node("ObjectCollision").disabled = true
		get_parent().find_node("Monkey").rotate(90)
		return Traits.Effect.SHINING
	return Traits.Effect.DARKENED
