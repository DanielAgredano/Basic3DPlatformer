extends Node3D


func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Attack"):
		$Camera3D/AnimationPlayer.play("Rise")

func startGame():
	get_tree().change_scene_to_file("res://scenes/main.tscn")
