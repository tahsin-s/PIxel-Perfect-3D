extends MeshInstance3D

#const offset_intercept = Globals.m_px16 * 1.0
const offset_slope = - Globals.m_px16 * 8.0
var mesh_shape = mesh as QuadMesh

@export var raycast: RayCast3D;
# Called when the node enters the scene tree for the first time.
func _get_offset():
	return mesh.size.y * offset_slope #+ offset_intercept

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var gnd_dist = raycast.global_position.y - raycast.get_collision_point().y
	gnd_dist = min(gnd_dist, Globals.mHeight)
	gnd_dist = max(gnd_dist, 0.0)
	mesh_shape.set_size(Vector2(mesh_shape.get_size().x, gnd_dist))
	mesh_shape.set_center_offset(Vector3(0.0, _get_offset(), 0.0))
