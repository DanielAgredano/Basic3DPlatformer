extends CharacterBody3D

@onready var m_body: Node3D = $M_body

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * 5.0 * delta
	if $AP.current_animation == "Death":
		#print($M_body/Rig_Medium/Skeleton3D.position)
		#$Smoke.position = $M_body/Rig_Medium/Skeleton3D.position
		return
	#print($Range.get_overlapping_areas())
	velocity = Vector3(0,0,0)
	$AP.speed_scale = 1.0
	if position.distance_to(Game.player.position)<0.5 and $T_CD.is_stopped():
		$T_CD.start()
	if $Range.get_overlapping_areas() and $T_CD.is_stopped():
		m_body.look_at(Game.player.position,Vector3(0,1,0),false)
		m_body.rotate(Vector3(0,1,0),PI)
		m_body.rotation.x = 0.0
		$AP.speed_scale = 2.5
		velocity = delta*256.0*Vector3(0,0,1).rotated(Vector3(0,1,0),m_body.rotation.y)
	move_and_slide()

func shoot():
	var instance = load("res://scenes/enemies/magic.tscn").instantiate()
	instance.position = position + Vector3(0.0,0.7,0.75).rotated(Vector3(0,1,0),m_body.rotation.y)
	instance.rot = m_body.rotation.y
	Game.main.call_deferred("add_child",instance)


func hit(_area: Area3D) -> void:
	#$SmokePivot.rotation = m_body.rotation
	$AP.play("Death")
