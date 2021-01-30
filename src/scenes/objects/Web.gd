extends AbstractObject
class_name Web

func _ready():
	add_trait(Traits.Trait.STICKY)
	despawn()
