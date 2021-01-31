extends Actor
class_name AbstractObject

export var INNATE_TRAIT_BG_COLOR = Color(1, 0, 0, 1)

var innate_traits := []
var traits := []

var effect = null

onready var scene = get_owner()
onready var player_object = get_owner().find_node("Player")
onready var quest_checks = player_object.find_node("Quest")
onready var quest_sfx = quest_checks.find_node("Effect")

func fill_ui_lists():
	$TraitsList.clear()
	if $EffectsList != null:
		$EffectsList.clear()
	for t in innate_traits:
		$TraitsList.add_item(Traits.Trait.keys()[t].capitalize())
		var last = $TraitsList.get_item_count()-1
		$TraitsList.set_item_custom_fg_color(last, INNATE_TRAIT_BG_COLOR)
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

func add_trait_at(new_trait, index):
	traits[index] = new_trait
	effect = check_win_conditions()
	fill_ui_lists()

func remove_trait(trait):
	var index = traits.find(trait)
	traits.remove(index)
	effect = _check_win_conditions()
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
	fill_ui_lists()

func complete_quest(quest_check):
	make_all_traits_innate()
	quest_sfx.playing = false
	quest_check.visible = true
	quest_sfx.playing = true
	if quests_are_completed():
		scene.win()

func quests_are_completed():
	return quest_checks.find_node("BoatCheck").visible and quest_checks.find_node("BonfireCheck").visible and quest_checks.find_node("NativeCheck").visible

func traits_not_changed(new_innate_traits, new_traits):
	return new_innate_traits.size() == innate_traits.size() and new_traits.size() == traits.size()

func spawn():
	visible = true
	$ObjectCollision.disabled = false
	$TraitUiOpener/CollisionShape2D.disabled = false
	_do_on_spawn()

func _do_on_spawn():
	pass

func despawn():
	visible = false
	$ObjectCollision.disabled = true
	$TraitUiOpener/CollisionShape2D.disabled = true

func try_swap_trait(src, index):
	if src == null:
		return
	var dst
	var src_swap_trait = src.traits[index]
	var dst_swap_trait
	var src_swap_index = index
	var dst_swap_index
	if src == player_object:
		dst = player_object.peer_object
	else:
		dst = player_object
	dst_swap_index = dst.get_swap_index()
	if dst_swap_index == null:
		return
	dst_swap_trait = dst.get_swap_trait()
	dst.add_trait_at(src_swap_trait, dst_swap_index)
	src.add_trait_at(dst_swap_trait, src_swap_index)
	dst.show_lists()
	src.show_lists()

func get_swap_trait():
	if $TraitsList.is_anything_selected():
		if $TraitsList.get_selected_items()[0] >= innate_traits.size():
			return traits[$TraitsList.get_selected_items()[0] - innate_traits.size()]
	return null

func get_swap_index():
	if $TraitsList.is_anything_selected():
		if $TraitsList.get_selected_items()[0] >= innate_traits.size():
			return $TraitsList.get_selected_items()[0] - innate_traits.size()
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
	if body == player_object and self != player_object:
		body.show_lists()
		show_lists()

func _on_TraitUiOpener_body_exited(body):
	if body == player_object and self != player_object:
		body.hide_lists()
		hide_lists()

func _on_TraitsList_item_activated(index):
	if index < innate_traits.size():
		return
	try_swap_trait(self, index - innate_traits.size())

func _on_TraitsList_item_selected(index):
	if self != player_object:
		player_object.peer_object = self
