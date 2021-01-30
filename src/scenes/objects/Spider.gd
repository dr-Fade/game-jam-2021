extends AbstractObject
class_name Spider

onready var web = get_parent().find_node("Web")

func _ready():
	set_effect(Traits.Effect.WAITING)
	innate_traits.append(Traits.Trait.HUNGRY)
	fill_ui_lists()

func make_web():
	set_effect(Traits.Effect.HUNTING)
	web.spawn()
