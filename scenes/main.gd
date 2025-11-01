extends Node3D

func _ready() -> void:
	Game.main = $"."
	Game.coinCount = $CanvasLayer/Coin/Count
	Game.timerCount = $CanvasLayer/Time/Count

func _process(_delta: float) -> void:
	pass

func addSec():
	Game.timer += 1
	var time = Game.timer % 3600
	Game.timer = time
	var text = str(int(time)/60).pad_zeros(2)+":"+str(int(time)%60).pad_zeros(2)
	$CanvasLayer/Time/Count.text = text
