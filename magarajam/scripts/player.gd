extends CharacterBody3D

var near_machine = false
const SPEED = 5.0
const JUMP_VELOCITY = 4.5
@onready var raycast = $Camera3D/RayCast3D
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event):
	$Camera3D.rotation.x = clamp($Camera3D.rotation.x,-2,2)
	if event is InputEventMouseMotion:
		if !near_machine and Input.mouse_mode != Input.MOUSE_MODE_VISIBLE:
			rotate_y(deg_to_rad(-event.relative.x)*0.5)
			$Camera3D.rotate_x(deg_to_rad(-event.relative.y)*0.5)

var pickedup = false
var pickupoject
var parentobject
func _physics_process(delta):
	# Add the gravity.
	if pickedup:
		pickupoject.position = ($Camera3D.position*$Camera3D.rotation)+Vector3(0,0,-1)
		pickupoject.rotate_z(0.01)
		pickupoject.rotate_x(0.01)
		pickupoject.rotate_y(0.01)
		
	if raycast.is_colliding() and Input.is_action_just_pressed("etkileşim") and !pickedup:
		if raycast.get_collider().is_in_group("parcalar"):
			pickedup=true
			pickupoject=raycast.get_collider()
			parentobject = pickupoject.get_parent()
			pickupoject.get_parent().remove_child(pickupoject)
			add_child(pickupoject)
	
	

		
	if not is_on_floor():
		velocity.y -= gravity * delta
	
	if Input.is_action_just_pressed("flash"):
		$Camera3D/SpotLight3D.visible=!$Camera3D/SpotLight3D.visible
	
	if Input.is_action_just_pressed("etkileşim"):
		input_ray_pickable

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("left", "right", "forward", "backwards")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		if !$AudioStreamPlayer2D.playing:
			$AudioStreamPlayer2D.play()
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()


func _on_area_3d_body_exited(body):
	pass # Replace with function body.
