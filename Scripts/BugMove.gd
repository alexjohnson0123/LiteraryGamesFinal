class_name Bug
extends CharacterBody3D

const SPEED = 1.0

enum {STOPPED, WALKING}
var state
var time

var bug_grab_scene = preload("res://Scenes/BugGrab.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	time = randf_range(1.0, 3.0)
	state = randi_range(0,1)

func _process(delta):
	time -= delta
	
	if time <= 0:
		if state == WALKING:
			state = STOPPED
			time = randf_range(1.0, 7.0)
		elif state == STOPPED:
			state = WALKING
			rotate_y(randf_range(deg_to_rad(-120.0), deg_to_rad(120.0)))
			time = randf_range(1.0, 3.0)

func _physics_process(delta):
	var direction = (transform.basis * Vector3(0, 0, 1)).normalized()
	if state == WALKING:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = 0.0
		velocity.z = 0.0
	
	move_and_slide()	
	
func delete():
	var BugGrab = bug_grab_scene.instantiate()
	get_tree().current_scene.add_child(BugGrab)
	BugGrab.global_position = global_position
	queue_free()
