extends Control

@onready var label: Label = $Label

func _ready() -> void:
	create_tween().tween_method(_update_label,0 , 1000, 3).set_delay(1.0)

func _update_label(score: int) -> void:
	label.text = "得分" + str(score)
	pass
