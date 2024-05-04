extends Node3D

@onready var emitter = $GPUParticles3D

# Called when the node enters the scene tree for the first time.
func _ready():
	emitter.emitting = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !emitter.emitting:
		queue_free()
