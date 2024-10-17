extends KinematicBody2D

class_name Player

onready var player_sprite:Sprite = get_node("Texture")
var velocity:Vector2
export(int) var speed:int

# Variaveis da função de pulo
export(int) var jump_speed:int
export(int) var player_gravity:int
var jump_count:int = 0
# Variavel que verifica se o personagem está pulando
var landing:bool = false


func _physics_process(delta):
	horizontal_move()
	vertical_move()
	gravity(delta)
	velocity = move_and_slide(velocity, Vector2.UP)
	player_sprite.animate(velocity)
	

func horizontal_move():
	var input_direction:float = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left") 
	velocity.x = input_direction * speed
	print(velocity.x)
	
func vertical_move()->void:
	if is_on_floor():
		jump_count = 0
	if Input.is_action_just_pressed("ui_select") and jump_count <2:
		jump_count +=1
		velocity.y = jump_speed
		
func gravity(delta:float)->void:
	velocity.y += delta * player_gravity
	if velocity.y >= player_gravity:
		velocity.y = player_gravity	




