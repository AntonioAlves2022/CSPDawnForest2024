extends ParallaxBackground

class_name Background

# Atributos da classe
export(bool) var can_process
export(Array, int) var layer_speed

# Funções próprias da engine
func _ready():
	if can_process == false:
		set_physics_process(false)
		
func _physics_process(delta):
	for index in get_child_count():
		get_child(index).motion_offset.x -= delta * layer_speed[index]
