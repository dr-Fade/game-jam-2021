extends AbstractObject
class_name Monkey

func _ready():
	set_effect(Traits.Effect.UNCOOPEREATING)

func get_to_gold(gold_position):
	set_effect(Traits.Effect.PROTECTING)
	position = gold_position + Vector2(100,0)
	$ObjectCollision.scale = Vector2(0.83,0.2)
