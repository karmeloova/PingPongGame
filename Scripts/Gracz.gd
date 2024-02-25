extends CharacterBody2D
var move_dir = Vector2(0,0);
var move_speed = 400;

func _ready():
	position.y = 0; #ustawiamy platformę na środku

func _physics_process(delta):
	move_and_collide(move_speed*move_dir*delta); #zatrzymuje obiekt w moemencie wykrycia kolizji, przesuwa go o Vector move_speed*move_dir*delta

func _input(event):
	move_dir.y = int(Input.is_action_pressed("move_down_gracz"))-int(Input.is_action_pressed("move_up_gracz"));
