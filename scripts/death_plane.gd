extends Area3D

func entered(_area: Area3D) -> void:
	Game.player.hurt(1)
	if Game.player.hp > 0:
		Game.player.position = $"../Respawn".position
