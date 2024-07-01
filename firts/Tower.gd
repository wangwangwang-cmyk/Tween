extends Sprite2D

@onready var laser: RayCast2D = $Laser

var mouse_positino: Vector2

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
			# 获得两点之间的弧度
			var angle_to_mouse = global_position.direction_to(get_global_mouse_position()).angle()
			# 将角度限制在(-180, 180)这个区间内
			var current_angle = wrapf(global_rotation, -PI, PI)
			angle_to_mouse = wrapf(angle_to_mouse, -PI, PI)	
			# 计算最短角度差
			var angle_diff = angle_to_mouse - current_angle
			angle_diff = wrapf(angle_diff, -PI, PI)
			# 获得旋转后的角度
			var end_angle = current_angle + angle_diff
			# 进行位移
			var tween = create_tween()
			tween.tween_property(self, "global_rotation", end_angle, 0.5)
			
	pass

#
#var rotation_speed = 10.0  # 调整这个值来改变旋转速度
#
#func _process(delta):
	#var mouse_pos = get_global_mouse_position()
	#var angle_to_mouse = global_position.direction_to(mouse_pos).angle()
	#
	## 使用 wrapf 函数来确保角度在 -PI 到 PI 之间
	#var current_angle = wrapf(global_rotation, -PI, PI)
	#angle_to_mouse = wrapf(angle_to_mouse, -PI, PI)
	#
	## 计算最短角度差
	#var angle_diff = angle_to_mouse - current_angle
	#angle_diff = wrapf(angle_diff, -PI, PI)
	#print(angle_diff)
	#
	## 平滑旋转
	#global_rotation += angle_diff * rotation_speed * delta
