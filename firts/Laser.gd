extends RayCast2D

@onready var line: Line2D = $Line2D

#var is_casting := false:
	#set(v):
		#is_casting = v
		#set_physics_process(is_casting)
		#if is_casting:
			#appear()
		#else:
			#disappear()
		#pass

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
			appear()
			#disappear()
			#is_casting = not is_casting
		

func _ready() -> void:
	#set_physics_process(false)
	line.points[1] = Vector2.ZERO

func _physics_process(delta: float) -> void:
	var cast_point = target_position
	force_raycast_update()
	
	if is_colliding():
		cast_point = to_local(get_collision_point())
	
	line.points[1] = cast_point
	pass


func appear() -> void:
	
	disappear()
	await get_tree().create_timer(0.5).timeout
	
	var tween = create_tween()
	tween.tween_property(line, "width", 10, 0.2)
	tween.parallel().tween_property(self,"target_position", Vector2(1000,0), 0.4)
	tween.play()
	
	#await get_tree().create_timer(1).timeout
	#disappear()
	pass

func disappear() -> void:
	var tween = create_tween()
	tween.tween_property(line, "width", 0, 0.2)
	tween.parallel().tween_property(self,"target_position", Vector2.ZERO, 0.4)
	tween.play()
	pass
