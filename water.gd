extends Polygon2D

var original_points: PackedVector2Array
var water_angle: float = 0.0


func _ready():
	original_points = polygon.duplicate()


func _process(delta: float):
	var cup = get_parent()
	var target_angle: float = -cup.rotation

	water_angle = lerp_angle(
		water_angle,
		target_angle,
		5.0 * delta
	)

	update_water()


func update_water():
	var points = original_points.duplicate()

	var left_x: float = original_points[0].x
	var right_x: float = original_points[1].x

	var center_x: float = (left_x + right_x) / 2.0

	var surface_y: float = (
		original_points[0].y +
		original_points[1].y
	) / 2.0

	points[0].y = surface_y + tan(water_angle) * (left_x - center_x)
	points[1].y = surface_y + tan(water_angle) * (right_x - center_x)

	points[2] = original_points[2]
	points[3] = original_points[3]

	polygon = points
