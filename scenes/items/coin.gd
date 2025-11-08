extends Node3D

func entered(_area: Area3D) -> void:
	Game.addCoins()
	Game.player.coinSound()
	$AnimationPlayer.play("Collect")
