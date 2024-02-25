extends CharacterBody2D
var move_dir = Vector2(0,0)
var speed;

func _ready():
	position.y = 0;

func _physics_process(delta):
	move_and_collide(move_dir*delta*speed)
	

func _on_piłka_ball_direction(where):
	move_dir = Vector2(0,where)
	
	if($"../Piłka".position.x > 0) :
		speed = 300;
	else :
		speed = 100;

