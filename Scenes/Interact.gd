extends RayCast3D

@onready var label = $Label
@onready var counter = $"../../../CanvasLayer/Hud/Label"

var count = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	label.text = ""
	
	if is_colliding():
		var detected = get_collider()
		if detected is Bug:
			label.text = "Collect"
			if Input.is_action_just_pressed("interact"):
				count += 1
				counter._update(count)
				detected.delete()
				
