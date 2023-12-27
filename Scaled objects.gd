extends Node3D

# Called when the node enters the scene tree for the first time.
func _ready():
	# ensure pixels on xy and xz axes are displayed evenly
	scale.x = Globals.scale.x
	scale.y = Globals.scale.y
	scale.z = Globals.scale.z
	
	# offset position to ensure pixel shading is even
	position += Globals.mOffset
