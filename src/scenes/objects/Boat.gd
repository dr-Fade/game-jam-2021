extends AbstractObject
class_name Boat

func _ready():
	traits.append(Traits.Trait.ANGRY)
	traits.append(Traits.Trait.HEAVY)
	fill_traits_list()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
