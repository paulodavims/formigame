extends CharacterBody2D

var perseguir = false
var player
var direction 

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	if perseguir == true:
		player = get_node("../jogador")
		
		direction = (player.position - self.position).normalized()
		
		velocity.x = direction.x * 200
	else:
		velocity.x = 0
	



func _on_perseguirplayer_body_entered(body: Node2D) -> void: 
	print("entrou na colisao")
	if body.name == "player":
		perseguir = true


func _on_perseguirplayer_body_exited(body: Node2D) -> void:
	print("saiu da colisao")
	if body.name == "player":
		perseguir = false 
	move_and_slide()
