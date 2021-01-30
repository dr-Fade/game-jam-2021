extends AbstractObject
class_name Feather


func _ready():
	set_effect(Traits.Effect.LAYING)
	add_trait(Traits.Trait.LIGHT)

func _check_win_conditions():
	if (traits + innate_traits).has(Traits.Trait.EMPTY):
		return null
	else:
		return Traits.Effect.LAYING

func show_up():
	visible = true
	$ObjectCollision.disabled = false
	$TraitUiOpener/CollisionShape2D.disabled = false
