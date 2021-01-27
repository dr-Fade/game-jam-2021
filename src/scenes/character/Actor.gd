extends KinematicBody2D

class_name Actor

export var deltaSpeedCoef = 150
export var speed = Vector2(300, 300)

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


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
