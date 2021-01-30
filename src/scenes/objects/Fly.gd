extends AbstractObject
class_name Fly

onready var spider = get_parent().find_node("Spider")

func _ready():
	innate_traits.append(Traits.Trait.PESKY)
	despawn()

func _do_on_spawn():
	spider.make_web()
