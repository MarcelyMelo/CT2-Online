extends RigidBody2D


func _ready():
	$AnimatedSprite2D.playing = true
	var tipos_inimigo = $AnimatedSprite2D.frames.get_animation_names()
	$AnimatedSprite2D.animation = tipos_inimigo[randi() % tipos_inimigo.size()]
	
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
