extends AbstractObject
class_name Mask

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	innate_traits.append(Traits.Trait.METALLIC)
	fill_ui_lists()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
