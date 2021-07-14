extends KinematicBody


var hvel = Vector3.ZERO
var vvel = Vector3.ZERO
var walk_speed = 10.0
var jump_force = 15.0
var gravity = 30.0
var acceleration = 10.0


func _physics_process(delta):
	
	var target_velocity = Vector3.ZERO
	if Input.is_action_pressed("walk_up"):
		target_velocity -= $HRot.transform.basis.z
	if Input.is_action_pressed("walk_down"):
		target_velocity += $HRot.transform.basis.z
	if Input.is_action_pressed("walk_left"):
		target_velocity -= $HRot.transform.basis.x
	if Input.is_action_pressed("walk_right"):
		target_velocity += $HRot.transform.basis.x
	if target_velocity != Vector3.ZERO:
		target_velocity = target_velocity.normalized() * walk_speed
	hvel = lerp(hvel, target_velocity, acceleration * delta)
	
	if is_on_floor():
		if Input.is_action_pressed("jump"):
			vvel.y = jump_force
		else:
			vvel.y = -1.0
	else:
		vvel.y -= gravity * delta
	
	move_and_slide(hvel + vvel, Vector3.UP, true)

