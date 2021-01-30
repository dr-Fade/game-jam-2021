extends Actor
class_name AbstractObject

export var MAX_TRAITS = 2
export var INNATE_TRAIT_BG_COLOR = Color(1, 0, 0, 1)

var innate_traits := []
var traits := []

var effect = null

onready var player_object = get_owner().find_node("Player")

func fill_ui_lists():
	$TraitsList.clear()
	if $EffectsList != null:
		$EffectsList.clear()
	for t in innate_traits:
		$TraitsList.add_item(Traits.Trait.keys()[t].capitalize())
		var last = $TraitsList.get_item_count()-1
		$TraitsList.set_item_custom_bg_color(last, INNATE_TRAIT_BG_COLOR)
	for t in traits:
		$TraitsList.add_item(Traits.Trait.keys()[t].capitalize())
	if effect != null and self != player_object:
		$EffectsList.add_item(Traits.Effect.keys()[effect].capitalize())

func add_trait(new_trait):
	var new_innate_traits = Traits.fit_trait(new_trait, innate_traits)
	var new_traits = Traits.fit_trait(new_trait, traits)
	if traits_not_changed(new_innate_traits, new_traits) and trait_slots_available():
		new_traits.append(new_trait)
	innate_traits = new_innate_traits
	traits = new_traits
	effect = check_win_conditions()
	fill_ui_lists()

func check_win_conditions():
	if traits.has(Traits.Trait.EMPTY):
		return Traits.Effect.UNDEF
	else:
		return _check_win_conditions()

func _check_win_conditions():
	return effect

func set_effect(new_effect):
	effect = new_effect

func traits_not_changed(new_innate_traits, new_traits):
	return new_innate_traits.size() == innate_traits.size() and new_traits.size() == traits.size()

func trait_slots_available():
	return traits.size() + innate_traits.size() < MAX_TRAITS

func remove_trait(trait):
	var index = traits.find(trait)
	traits.remove(index)
	effect = _check_win_conditions()
	fill_ui_lists()

func try_swap_trait(src, dst, trait):
	if src == null \
	or dst == null \
	or !Traits.is_new_trait_compatible(trait, dst.traits) \
	or !dst.trait_slots_available():
		return
	var target_swap_trait = dst.get_target_swap_trait()
	if target_swap_trait != null:
		dst.remove_trait(target_swap_trait)
		src.remove_trait(trait)
		dst.add_trait(trait)
		src.add_trait(target_swap_trait)
		dst.show_lists()
		src.show_lists()

func get_target_swap_trait():
	if $TraitsList.is_anything_selected():
		if $TraitsList.get_selected_items()[0] >= innate_traits.size():
			return (innate_traits + traits)[$TraitsList.get_selected_items()[0]]
	return null

func show_lists():
	$TraitsList.visible = true
	if $EffectsList != null:
		$EffectsList.visible = effect != null

func hide_lists():
	$TraitsList.visible = false
	if $EffectsList != null:
		$EffectsList.visible = false

func _on_TraitUiOpener_body_entered(body):
	if body == player_object:
		show_lists()

func _on_TraitUiOpener_body_exited(body):
	if body == player_object:
		hide_lists()

func _on_TraitsList_item_activated(index):
	if index < innate_traits.size():
		return
	var trait = traits[index - innate_traits.size()]
	try_swap_trait(self, player_object, trait)
