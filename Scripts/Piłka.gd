extends RigidBody2D
var move_dir = Vector2(-1,1)
var speed = 500;
@onready var screenSize = get_viewport_rect();
signal ballDirection(where)
signal playerScore
signal computerScore
var isTheEnd = false

# Called when the node enters the scene tree for the first time.
func _ready():
	contact_monitor = true; #musi być ustawione, aby można było wykrywać kolizje
	max_contacts_reported = 3; #musi być >0 aby wykrywać kolizje 

func _physics_process(delta):
	if(not(isTheEnd)) :
		var isCollision = move_and_collide(delta*move_dir*speed);
		if(isCollision) : 
			move_dir = move_dir.bounce(isCollision.get_normal()) #funkcja do odbicia 
		if(position.x > screenSize.size.x/2) : 
			position = Vector2(0,0);
			emit_signal("playerScore")
		elif(position.x < -screenSize.size.x/2) :
			position = Vector2(0,0);
			emit_signal("computerScore")
		if(move_dir.y > 0) : emit_signal("ballDirection", 1)
		else : emit_signal("ballDirection", -1)
	else :
		position = Vector2(0,0);

func _on_score_theend():
	isTheEnd = true;
