extends Node3D

func _ready() -> void:
	Game.main = $"."
	Game.coinCount = $CanvasLayer/Coin/Count
	$CanvasLayer/Coin/Count.text = "x"+str(Game.coins).pad_zeros(2)
	Game.timerCount = $CanvasLayer/Time/Count

func _process(_delta: float) -> void:
	pass

func addSec():
	Game.timer += 1
	var time = Game.timer % 3600
	Game.timer = time
	var text = str(int(time)/60).pad_zeros(2)+":"+str(int(time)%60).pad_zeros(2)
	$CanvasLayer/Time/Count.text = text

func togglePause():
	var newP = not get_tree().paused
	get_tree().paused = newP
	$CanvasLayer/Pause/Text.visible = newP
	if newP:
		Game.player.release_mouse()
	else:
		Game.player.capture_mouse()

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("Pause"):
		togglePause()
	if get_tree().paused and event.is_action_pressed("Attack"):
		togglePause()
		Game.player.capture_mouse()

func playGoal():
	$Music.stream = load("res://sounds/heart container 1.wav")
	$Music.play()

func resetGame():
	get_tree().change_scene_to_file("res://scenes/mainScreen.tscn")
