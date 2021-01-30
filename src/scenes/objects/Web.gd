extends AbstractObject
class_name Web

func _ready():
	visible = false
	$ObjectCollision.disabled = true
	
	set_effect(Traits.Effect.BLOOMING)
	add_trait(Traits.Trait.STICKY)
	add_trait(Traits.Trait.EMPTY)

func _check_win_conditions():
	if traits.has(Traits.Trait.STICKY):
		return Traits.Effect.BLOOMING
	return Traits.Effect.BROKEN
	
