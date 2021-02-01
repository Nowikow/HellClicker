extends Node2D

func _ready():
	
	if Global.Load == 'Burn':
		$Burning.visible = true
	else:
		$TakenDemons.visible = true
#	$AnimationPlayer.play("New Anim")
#	$AnimationPlayer2.play("New Anim")
#	$AnimationPlayer3.play("New Anim")
	$TakenDemons/AnimationPlayer.play("New Anim")
	$TakenDemons/AnimationPlayer2.play("New Anim")
	$TakenDemons/AnimationPlayer3.play("New Anim")
	$Burning/AnimationPlayer.play("New Anim")

func _process(_delta):
	var clouds_position = $TakenDemons/ParallaxBackground/ParallaxLayer/Sprite.get_position()
	$TakenDemons/ParallaxBackground/ParallaxLayer/Sprite.set_position(Vector2(clouds_position.x - 15, clouds_position.y))
	$TakenDemons/ParallaxBackground/ParallaxLayer.motion_mirroring = $TakenDemons/ParallaxBackground/ParallaxLayer/Sprite.texture.get_size().rotated($TakenDemons/ParallaxBackground/ParallaxLayer/Sprite.global_rotation)


func _input(event):
	if event is InputEventMouseButton:
		Global.IsDead=true
		Global.changer('res://Scenes/FamilieTree.tscn', true, 'Tree')


