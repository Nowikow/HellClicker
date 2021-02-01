extends TextureButton
signal Pressed

var Type
var Sin
var Index

func _on_TableButton_button_down():
	mouse_filter=MOUSE_FILTER_IGNORE

func _on_TableButton_pressed():
	PressOnbutton()

func PressOnbutton():
	disabled=true
	$Tween.interpolate_property(self, "rect_scale", Vector2(1.5, 0.5), Vector2(1.0, 1.0), 0.75, $Tween.TRANS_ELASTIC, $Tween.EASE_OUT)
	$Tween.start()

func _on_Tween_tween_all_completed():
	emit_signal("Pressed", Type, Sin)
