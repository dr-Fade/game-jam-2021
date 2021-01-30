extends AbstractObject

var obj : AbstractObject
var peer_object: AbstractObject = null

func _ready():
	traits.append(Traits.Trait.EMPTY)
	traits.append(Traits.Trait.EMPTY)
	traits.append(Traits.Trait.EMPTY)
	fill_ui_lists()

func _physics_process(delta) -> void:
	var deltaSpeed = deltaSpeedCoef * delta
	var speedX = speed.x * deltaSpeed
	var speedY = speed.y * deltaSpeed
	
	var velocityX: = Vector2(speedX, 0)
	var velocityY: = Vector2(0, speedY)
	
	if Input.is_key_pressed(KEY_D):
		move_and_slide(velocityX)
	if Input.is_key_pressed(KEY_A):
		move_and_slide(-velocityX)
	if Input.is_key_pressed(KEY_W):
		move_and_slide(-velocityY)
	if Input.is_key_pressed(KEY_S):
		move_and_slide(velocityY)

func _on_TraitUiOpener_body_entered(body):
	if body is AbstractObject and body != self:
		peer_object = body as AbstractObject

func _on_TraitUiOpener_body_exited(body):
	if body is AbstractObject and body != self:
		peer_object = null

func _on_TraitsList_item_activated(index):
	var trait = traits[index - innate_traits.size()]
	try_swap_trait(self, peer_object, trait)
