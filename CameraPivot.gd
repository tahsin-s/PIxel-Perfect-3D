extends Marker3D

@export var target: Node3D
@export var offset: Vector3;
# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var newpos = target.global_position + Globals.mOffset
	set_global_position(newpos.snapped(Globals.snap))
