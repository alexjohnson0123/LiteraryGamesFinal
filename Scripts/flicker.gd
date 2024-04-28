extends OmniLight3D

var time = 0
const INTENSITY = 2.0
const FLICKER = 0.2
const SPEED = 20

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += delta
	light_energy = sin(time * SPEED) * FLICKER + INTENSITY
