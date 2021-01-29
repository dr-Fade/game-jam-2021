extends Node

# a set of adjectives that describe effects that objects have on each other
enum Trait {
	# material
	WOODEN,
	GLASSY,
	METALLIC,
	CLOTH,
	FLESHY,
	# qualities
	POISONOUS,
	HEALING,
	BURNING,
	WET,
	DRY,
	SHARP,
	DULL,
	STICKY,
	AGGRESSIVE,
	CALM
}
func name_to_trait(name):
	return Trait.keys().find(name)

# list of traits that cannot be in the same object and must annihilate
export var annihilation_map = [
	Vector2(Trait.HEALING, Trait.POISONOUS),
	Vector2(Trait.WET, Trait.STICKY),
	Vector2(Trait.SHARP, Trait.DULL),
	Vector2(Trait.AGGRESSIVE, Trait.CALM),
]

# list of traits that transform into another trait
export var synergy_map = {
	Vector2(Trait.BURNING, Trait.WET): Trait.DRY,
}	

# list of traits that cannot be in the same object and must NOT annihilate
export var incompatibility_map = [
	Vector2(Trait.GLASSY, Trait.BURNING),
	Vector2(Trait.METALLIC, Trait.BURNING),
]

func synergize_traits(new_trait, old_traits) -> Array:
	var new_traits := []
	for q in old_traits:
		var synergized = synegrize_traits(new_trait, q)
		if synergized != null:
			new_traits.append(synergized)
		else:
			new_traits.append(q)
	return new_traits

func annihilate_traits(new_trait, old_traits) -> Array:
	var new_traits := []
	for q in old_traits:
		if !traits_annihilate(new_trait, q):
			new_traits.append(q)
	return new_traits

func traits_incompatible(t1, t2) -> bool:
	return Traits.incompatibility_map.has(Vector2(t1, t2)) || Traits.incompatibility_map.has(Vector2(t2, t1))

func traits_annihilate(t1, t2) -> bool:
	return Traits.annihilation_map.has(Vector2(t1, t2)) || Traits.annihilation_map.has(Vector2(t2, t1))

func synegrize_traits(t1, t2):
	if Traits.synergy_map.has(Vector2(t1, t2)):
		return Traits.synergy_map[Vector2(t1, t2)]
	elif Traits.synergy_map.has(Vector2(t2, t1)):
		return Traits.synergy_map[Vector2(t2, t1)]
	else:
		return null

func is_new_trait_compatible(new_trait, traits) -> bool:
	for t in traits:
		if traits_incompatible(new_trait, t) or new_trait == t:
			return false
	return true
