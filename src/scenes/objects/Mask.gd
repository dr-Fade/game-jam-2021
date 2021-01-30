extends AbstractObject
class_name Mask

onready var feather = get_owner().find_node("Feather")

var feather_spawned = false

func _ready():
	set_effect(Traits.Effect.AMUSING)
	add_trait(Traits.Trait.METALLIC)

func _check_win_conditions():
	if get_traits().has(Traits.Trait.ANGRY):
		if !feather_spawned:
			feather.show_up()
			innate_traits += traits
			traits.clear()
			fill_ui_lists()
			feather_spawned = true
			$TraitUiOpener/CollisionShape2D.disabled = true
		return Traits.Effect.HORRIFIYNG
	elif !((traits + innate_traits).has(Traits.Trait.EMPTY)):
		return Traits.Effect.AMUSING
	else:
		return null

