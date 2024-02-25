extends Node2D
var playerScore = 0;
var computerScore = 0;
signal theend


# Called when the node enters the scene tree for the first time.
func _ready():
	$PlayerScore.text = "0"
	$ComputerScore.text = "0"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_piłka_computer_score():
	computerScore +=1;
	$ComputerScore.text = str(computerScore)
	if(computerScore==11) : 
		emit_signal("theend")
		$WhoWin.text = "Computer Won"

func _on_piłka_player_score():
	playerScore += 1;
	$playerScore.text = str(playerScore)
	if(playerScore==11) : 
		emit_signal("theend")
		$WhoWin.text = "You Won"
