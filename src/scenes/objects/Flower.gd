extends AbstractObject
class_name Flower

func _ready():
	set_effect(Traits.Effect.ROATING)
	add_trait(Traits.Trait.EMPTY)
	add_trait(Traits.Trait.EMPTY)

func _check_win_conditions():
	if traits.has(Traits.Trait.NASTY):
		get_parent().find_node("Fly").visible = true;
		get_parent().find_node("Web").visible = true;
		get_parent().find_node("Web").find_node("TraitUiOpener").find_node("CollisionShape2D").disabled = false
		get_parent().find_node("Web").find_node("ObjectCollision").disabled = false
		return Traits.Effect.ROATING
	return Traits.Effect.BLOOMING
