extends Node3D

var speed = Vector3(0,0,0.05)
var rot = (PI/2)*1

func _ready() -> void:
	rotate(Vector3(0,1,0),rot)
	speed = speed.rotated(Vector3(0,1,0),rot)

func _process(_delta: float) -> void:
	position += speed
	pass

func finish() -> void:
	$AnimationPlayer.play("Disappear")

func entered(_area) -> void:
	$AnimationPlayer.play("Disappear")
