extends Node

# a set of adjectives that describe effects that objects have on each other
enum Trait {
	# crutch
	EMPTY
	# material
	WOODEN,
	GLASSY,
	METALLIC,
	CLOTH,
	FLESHY,
	# qualities
	POISONOUS,
	HEALING,
	HOT,
	WET,
	SHARP,
	DULL,
	STICKY,
	AGGRESSIVE,
	CALM,
	ANGRY,
	HEAVY,
	NERVOUS,
	LIGHT,
	MAGICAL,
}

# when traits are combined, they can create an effect
enum Effect {
	UNDEF,
	BURNING,
	SINKING,
	KILLING,
	BROKEN,
	ERUPTING,
	FLOATING,
	LAYING,
	HORRIFIYNG,
	AMUSING,
	CALMED
}

# list of traits that cannot be in the same object and must annihilate
export var annihilation_map = [
	#Vector2(Trait.HEALING, Trait.POISONOUS),
	#Vector2(Trait.WET, Trait.STICKY),
	#Vector2(Trait.AGGRESSIVE, Trait.CALM),
	#Vector2(Trait.HEAVY, Trait.LIGHT),
]

# list of traits that transform into another trait
export var synergy_map = {
	#Vector2(Trait.SHARP, Trait.DULL): Trait.DULL,
}

# list of traits that cannot be in the same object and must NOT annihilate
export var incompatibility_map = []

export var effects_map = {
	#Vector2(Trait.WOODEN, Trait.HOT): Effect.BURNING,
	#Trait.HEAVY: Effect.SINKING,
}

func fit_trait(new_trait, traits):
	return Traits.annihilate_traits(
		new_trait,
		Traits.synergize_traits(
			new_trait,
			traits
		)
	)

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
	return incompatibility_map.has(Vector2(t1, t2)) || incompatibility_map.has(Vector2(t2, t1))

func traits_annihilate(t1, t2) -> bool:
	return annihilation_map.has(Vector2(t1, t2)) || annihilation_map.has(Vector2(t2, t1))

func synegrize_traits(t1, t2):
	if synergy_map.has(Vector2(t1, t2)):
		return synergy_map[Vector2(t1, t2)]
	elif synergy_map.has(Vector2(t2, t1)):
		return synergy_map[Vector2(t2, t1)]
	else:
		return null

func is_new_trait_compatible(new_trait, traits) -> bool:
	for t in traits:
		if traits_incompatible(new_trait, t) or (new_trait == t and t != Trait.EMPTY):
			return false
	return true

func get_effects(traits):
	var effects = []
	for i in range(traits.size()-1):
		for j in range(i+1,traits.size()):
			var t1 = traits[i]
			var t2 = traits[j]
			if effects_map.has(Vector2(t1, t2)):
				effects.append(effects_map[Vector2(t1, t2)])
			elif effects_map.has(Vector2(t2, t1)):
				effects.append(effects_map[Vector2(t2, t1)])
	return effects
