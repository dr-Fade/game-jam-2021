extends Actor
class_name AbstractObject

export var MAX_TRAITS = 2
export var INNATE_TRAIT_BG_COLOR = Color(1, 0, 0, 1)

var innate_traits := []
var traits := []

var effect = null

onready var player_object = get_owner().find_node("Player")
onready var quest_checks = player_object.find_node("Quest")

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
		$EffectsList.visible = true

func add_trait(new_trait):
	var new_innate_traits = Traits.fit_trait(new_trait, innate_traits)
	var new_traits = Traits.fit_trait(new_trait, traits)
	if traits_not_changed(new_innate_traits, new_traits):
		new_traits.append(new_trait)
	innate_traits = new_innate_traits
	traits = new_traits
	effect = check_win_conditions()
	fill_ui_lists()

func get_traits():
	return innate_traits + traits

func make_all_traits_innate():
	innate_traits += traits
	traits.clear()
	fill_ui_lists()

func check_win_conditions():
	return _check_win_conditions()

func _check_win_conditions():
	return effect

func set_effect(new_effect):
	effect = new_effect

func complete_quest(quest_check):
	make_all_traits_innate()
	quest_check.visible = true

func traits_not_changed(new_innate_traits, new_traits):
	return new_innate_traits.size() == innate_traits.size() and new_traits.size() == traits.size()

func remove_trait(trait):
	var index = traits.find(trait)
	traits.remove(index)
	effect = _check_win_conditions()
	fill_ui_lists()

func try_swap_trait(src, dst, trait):
	if src == null \
	or dst == null:
		return
	var target_swap_trait = dst.get_target_swap_trait()
	if target_swap_trait != null \
	and (Traits.is_new_trait_compatible(trait, dst.get_traits()) \
	or Traits.is_new_trait_compatible(target_swap_trait, src.get_traits())):
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
		$EffectsList.visible = effect != null

func _on_TraitUiOpener_body_entered(body):
	if body == player_object:
		body.show_lists()
		show_lists()

func _on_TraitUiOpener_body_exited(body):
	if body == player_object:
		body.hide_lists()
		hide_lists()

func _on_TraitsList_item_activated(index):
	if index < innate_traits.size():
		return
	var trait = traits[index - innate_traits.size()]
	try_swap_trait(self, player_object, trait)
