extends Node2D


@export var bottle_scene: PackedScene
@onready var screen_size = get_viewport_rect().size

@export_category("Timers")
@export var spawn_timer := 0.0
@export var spawn_interval := 0.8

func _process(delta: float) -> void:
    spawn_timer += delta
    
    if spawn_timer > spawn_interval:
        spawn_timer = 0
        spawn_bottle()
        
        spawn_interval = randf_range(0.3, 1.2)
        
func spawn_bottle() -> void:
    var bottle = bottle_scene.instantiate()
    var random_x = randf_range(50.0, screen_size.x - 50.0)
    bottle.position = Vector2(random_x, screen_size.y )
    add_child(bottle)
