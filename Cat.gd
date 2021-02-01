extends TextureButton

var IsDelete=false
var IsUp=false

signal PressOnButton
signal Exit

#Cat Appear
func _ready():
	IsUp=true
	$Tween.interpolate_property(self, "rect_position", Vector2(0, 0), Vector2(0, -400), 0.3, $Tween.TRANS_LINEAR, $Tween.EASE_OUT)
	$Tween.start()
	$PressTimer.start()

func _on_Tween_tween_all_completed():
	if IsDelete:
		queue_free()
		IsDelete=false

#Press a button
func _on_PressTimer_timeout():
	MoveLeg()

func _on_Leg_LegFinished():
	MoveBack()

func MoveLeg():
	$Leg.show()
	$Leg.play()
	emit_signal("PressOnButton")

#Go away
func MoveBack():
	$PressTimer.stop()
	$Tween.interpolate_property(self, "rect_position", Vector2(0, -400), Vector2(0, 0), 0.3, $Tween.TRANS_LINEAR, $Tween.EASE_OUT)
	$Tween.start()
	emit_signal("Exit")
	IsDelete=true

func _on_Cat_pressed():
	$PressTimer.stop()
	IsUp=false
	disabled=true
	yield(get_tree().create_timer(1.5), "timeout")
	MoveBack()
