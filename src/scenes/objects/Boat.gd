extends AbstractObject
class_name Boat

func _ready():
	innate_traits.append(Traits.Trait.ANGRY)
	innate_traits.append(Traits.Trait.HEAVY)
	fill_ui_lists()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
