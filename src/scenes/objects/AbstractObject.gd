extends Actor
class_name AbstractObject

var traits := []

onready var player_object = get_owner().get_node("Player")

func _ready():
	pass

func fill_traits_list():
	$TraitsList.clear()
	for t in traits:
		$TraitsList.add_item(Traits.Trait.keys()[t].capitalize())

func add_trait(new_trait):
	var transformed_traits = Traits.annihilate_traits(
		new_trait,
		Traits.synergize_traits(
			new_trait,
			traits
		)
	)
	if transformed_traits.size() == traits.size():
		transformed_traits.append(new_trait)
	traits = transformed_traits
	fill_traits_list()

func remove_trait(trait):
	var index = traits.find(trait)
	traits.remove(index)

func try_pass_trait(src, dst, trait):
	if src == null or dst == null or !Traits.is_new_trait_compatible(trait, dst.traits):
		return
	dst.add_trait(trait)
	dst.fill_traits_list()
	src.remove_trait(trait)
	src.fill_traits_list()

func _on_TraitUiOpener_body_entered(body):
	if body == player_object:
		$TraitsList.visible = true

func _on_TraitUiOpener_body_exited(body):
	if body == player_object:
		$TraitsList.visible = false

func _on_TraitsList_item_activated(index):
	var trait = traits[index]
	try_pass_trait(self, player_object, trait)
