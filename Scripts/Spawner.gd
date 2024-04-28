extends Node3D

var bug_scene = preload("res://Scenes/Bug.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	for x in 100:
		spawn()

func spawn():
	var bug = bug_scene.instantiate()
	add_child(bug)
	bug.position = Vector3(randf_range(-100.0, 100.0), 0, randf_range(-100.0, 100.0))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
