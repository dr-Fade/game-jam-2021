extends AbstractObject

func _ready():
	innate_traits.append(Traits.Trait.AGGRESSIVE)
	innate_traits.append(Traits.Trait.HOT)
	effect = Traits.Effect.ERUPTING
	fill_ui_lists()

func _check_win_conditions():
	if get_traits().has(Traits.Trait.AGGRESSIVE):
		return Traits.Effect.ERUPTING
	else:
		$Lava.playing = false
		return Traits.Effect.SLEEPING

func stop_erupting():
	innate_traits = [Traits.Trait.CALM]
	traits = [Traits.Trait.HOT]
	effect = check_win_conditions()
	fill_ui_lists()
