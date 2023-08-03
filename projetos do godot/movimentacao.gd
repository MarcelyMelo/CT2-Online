extends CharacterBody2D

@export var velocidade = 400

func get_input():
	var direcao = Input.get_vector("left", "right", "up", "down")
	velocity = direcao * velocidade
	
func _physics_process(delta):
	get_input()
	move_and_slide()
