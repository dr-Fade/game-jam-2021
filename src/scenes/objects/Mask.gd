extends AbstractObject
class_name Mask

onready var seagul = get_owner().find_node("Seagul")

func _ready():
	set_effect(Traits.Effect.AMUSING)
	add_trait(Traits.Trait.METALLIC)

func _check_win_conditions():
	if get_traits().has(Traits.Trait.ANGRY):
		seagul.spawn_feather()
		make_all_traits_innate()
		$TraitUiOpener/CollisionShape2D.disabled = true
		return Traits.Effect.HORRIFIYNG
	elif !get_traits().has(Traits.Trait.EMPTY):
		return Traits.Effect.AMUSING
	else:
		return null

