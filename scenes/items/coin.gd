extends Node3D

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	pass

func entered(_area: Area3D) -> void:
	Game.addCoins()
	$AnimationPlayer.play("Collect")
