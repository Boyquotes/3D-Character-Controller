extends Spatial


var target_hrot = deg2rad(0.0)
var target_vrot = deg2rad(-20.0)
var min_vrot = deg2rad(-80.0)
var max_vrot = deg2rad(40.0)

var sensitivity = 0.5
var rot_speed = 10.0


func _ready():
	$VRot/Camera.add_exception(owner)
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _process(delta):
	rotation.y = lerp(rotation.y, target_hrot, rot_speed * delta)
	$VRot.rotation.x = lerp($VRot.rotation.x, target_vrot, rot_speed * delta)


func _unhandled_input(event):
	if event is InputEventMouseMotion:
		target_hrot -= deg2rad(event.relative.x) * sensitivity
		target_vrot -= deg2rad(event.relative.y) * sensitivity
		target_vrot = clamp(target_vrot, min_vrot, max_vrot)

