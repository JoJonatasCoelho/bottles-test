extends RigidBody2D

@export var bottle_sprite: AnimatedSprite2D


func _ready() -> void:
    bottle_sprite.play("default")
    var horizontal_speed = randf_range(-250.0, 250.0)
    var vertical_speed = randf_range(-850.0, -550.0)
    linear_velocity = Vector2(horizontal_speed, vertical_speed)
    angular_velocity = randf_range(-8.0, 8.0)


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
    queue_free()

func _on_area_2d_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
   if event is InputEventMouseButton:
        if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
            bottle_sprite.play("break")
            await bottle_sprite.animation_finished
            queue_free()
