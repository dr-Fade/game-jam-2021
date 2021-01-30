extends AbstractObject
class_name Crystals

func _ready():
	add_trait(Traits.Trait.MAGICAL)
	add_trait(Traits.Trait.BRIGHT)
	despawn()

func show_up():
	visible = true
	$ObjectCollision.disabled = false
	$TraitUiOpener/CollisionShape2D.disabled = false
