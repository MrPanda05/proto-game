# debug_draw.gd  (Autoload name: DebugDraw)
extends Node2D

const ARROW_SIZE := 12.0
const LINE_WIDTH := 2.0

var vectors: Array[Dictionary] = []

func _ready() -> void:
	top_level = true          # ignore parent transforms
	z_index = 4096            # draw above everything
	global_position = Vector2.ZERO

# origin: global position where the vector starts
# vec:    the vector itself (e.g. a velocity), NOT an end point
func DrawVector(origin: Vector2, vec: Vector2, color: Color = Color.RED) -> void:
	vectors.append({ "origin": origin, "vec": vec, "color": color })
	queue_redraw()

func Clear() -> void:
	vectors.clear()
	queue_redraw()

func _draw() -> void:
	for v in vectors:
		_draw_arrow(to_local(v.origin), v.vec, v.color)
	vectors.clear()   # one-frame lifetime: callers re-submit each frame

func _draw_arrow(start: Vector2, vec: Vector2, color: Color) -> void:
	if vec.is_zero_approx():
		return

	var end := start + vec
	draw_line(start, end, color, LINE_WIDTH)

	var dir := vec.normalized()
	var perpendicular := Vector2(-dir.y, dir.x)
	var left := end - dir * ARROW_SIZE + perpendicular * ARROW_SIZE * 0.5
	var right := end - dir * ARROW_SIZE - perpendicular * ARROW_SIZE * 0.5

	draw_line(end, left, color, LINE_WIDTH)
	draw_line(end, right, color, LINE_WIDTH)
