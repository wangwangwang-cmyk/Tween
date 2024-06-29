extends Node2D

@onready var sprite: Sprite2D = $Sprite2D
@onready var health_bar: ProgressBar = $Sprite2D/healthBar

var speed := 300.0
var health = 100

func _ready() -> void:
	health_bar.init_health(100)

func _physics_process(delta: float) -> void:
	
	var input_direction = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	
	sprite.position += input_direction * speed * delta
	
	if Input.is_action_just_pressed("ui_accept"):
		hit(Vector2(100,0))
		health -= 10
		health_bar.health = health
	
	pass

func hit(knock_back_strength:Vector2 = Vector2.ZERO, time := 0.25) -> void:
	
	var knockback_tween = get_tree().create_tween()
	
	knockback_tween.parallel().tween_property(sprite, "position", sprite.global_position+ knock_back_strength, time)
	sprite.modulate = Color.RED
	knockback_tween.parallel().tween_property(sprite, "modulate", Color.WHITE, time)
	pass
