extends AbstractObject
class_name Player

var peer_object = null
var acceps_inputs = true

func _ready():
	traits.append(Traits.Trait.EMPTY)
	traits.append(Traits.Trait.EMPTY)
	traits.append(Traits.Trait.EMPTY)
	fill_ui_lists()

func _physics_process(delta) -> void:
	if !acceps_inputs:
		return
	var deltaSpeed = deltaSpeedCoef * delta
	var speedX = speed.x * deltaSpeed
	var speedY = speed.y * deltaSpeed
	
	var velocityX: = Vector2(speedX, 0)
	var velocityY: = Vector2(0, speedY)
	
	if Input.is_key_pressed(KEY_D):
		move_and_collide(velocityX)
	if Input.is_key_pressed(KEY_A):
		move_and_collide(-velocityX)
	if Input.is_key_pressed(KEY_W):
		move_and_collide(-velocityY)
	if Input.is_key_pressed(KEY_S):
		move_and_collide(velocityY)
