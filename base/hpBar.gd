extends ProgressBar

var health_tween

var health := 0.0 :
	set(v):
		health = v
		var pre_health = health
		health = clamp(v, 0, max_value)
		
		health_tween = create_tween().tween_property(self, "value", health, 0.3).set_trans(Tween.TRANS_LINEAR)
		
		if health <= 0:
			queue_free()

func init_health(_health:float) -> void:
	health = _health
	max_value = health
	value = health
