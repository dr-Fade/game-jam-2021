extends AbstractObject
class_name Fly

func _ready():
	visible = false
	$ObjectCollision.disabled = true
	$EffectsList.free()

	add_trait(Traits.Trait.EMPTY)
	add_trait(Traits.Trait.EMPTY)

func _check_win_conditions():
	return null
	
func _physics_process(delta) -> void:
	rotate(delta)
