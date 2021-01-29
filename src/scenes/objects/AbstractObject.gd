extends Actor
class_name AbstractObject

export var MAX_TRAITS = 2
export var MAX_INNATE_TRAITS = 2
export var INNATE_TRAIT_BG_COLOR = Color(1, 0, 0, 1)

var innate_traits := []
var traits := []

var effects := []

onready var player_object = get_owner().get_node("Player")

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
	for e in effects:
		$EffectsList.add_item(Traits.Effect.keys()[e].capitalize())

func add_trait(new_trait):
	var new_innate_traits = Traits.fit_trait(new_trait, innate_traits)
	var new_traits = Traits.fit_trait(new_trait, traits)
	if traits_not_changed(new_innate_traits, new_traits) and trait_slots_available():
		new_traits.append(new_trait)
	innate_traits = new_innate_traits
	traits = new_traits
	effects = Traits.get_effects(traits + innate_traits)
	fill_ui_lists()

func traits_not_changed(new_innate_traits, new_traits):
	return new_innate_traits.size() == innate_traits.size() and new_traits.size() == traits.size()

func trait_slots_available():
	return traits.size() < MAX_TRAITS

func remove_trait(trait):
	var index = traits.find(trait)
	traits.remove(index)

func try_pass_trait(src, dst, trait):
	if src == null \
	or dst == null \
	or !Traits.is_new_trait_compatible(trait, dst.traits) \
	or !dst.trait_slots_available():
		return
	dst.add_trait(trait)
	dst.fill_ui_lists()
	src.remove_trait(trait)
	src.fill_ui_lists()

func _on_TraitUiOpener_body_entered(body):
	if body == player_object:
		$TraitsList.visible = true
		$EffectsList.visible = true

func _on_TraitUiOpener_body_exited(body):
	if body == player_object:
		$TraitsList.visible = false
		$EffectsList.visible = false

func _on_TraitsList_item_activated(index):
	var trait = innate_traits[index]
	try_pass_trait(self, player_object, trait)
