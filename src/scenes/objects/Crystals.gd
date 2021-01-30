extends AbstractObject

func _ready():
	add_trait(Traits.Trait.BRIGHT)

func show_up():
	visible = true
	$ObjectCollision.disabled = false
	$TraitUiOpener/CollisionShape2D.disabled = false
