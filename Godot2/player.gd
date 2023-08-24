extends Area2D
signal hit

@export var velocidade = 400
var tamanho_tela

func _ready():
	tamanho_tela = get_viewport_rect().size
	hide()

func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
		
	if velocity.length() > 0 :
		velocity = velocity.normalized() * velocidade
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()

	position += velocity * delta
	position.x = clamp(position.x, 0, tamanho_tela.x)
	position.y = clamp(position.y, 0, tamanho_tela.y)
	
# 	Esse é o código que estamos fazendo hoje

# != é "diferente de"
	if velocity.x != 0:
		$AnimatedSprite2D.animation = "Andar"
		$AnimatedSprite2D.flip_v = false 
		$AnimatedSprite2D.flip_h = velocity.x < 0
	if velocity.y != 0:
		$AnimatedSprite2D.animation = "Cima"
		$AnimatedSprite2D.flip_h = false 
		$AnimatedSprite2D.flip_v = velocity.y > 0

