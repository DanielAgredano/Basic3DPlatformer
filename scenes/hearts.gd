extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func update(hp):
	for heart in get_children():
		if hp > 1:
			heart.get_child(1).frame = 2
		if hp == 1:
			heart.get_child(1).frame = 1
		if hp < 1:
			heart.get_child(1).frame = 0
		hp-=2
