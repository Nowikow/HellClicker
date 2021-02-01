extends TextureButton

var IsPressed=false

func _on_ButtonMenuPrototype_pressed():
	$Tween.interpolate_property(self, "rect_scale", Vector2(1.5, 0.5), Vector2(1.0, 1.0), 0.75, $Tween.TRANS_ELASTIC, $Tween.EASE_OUT)
	$Tween.interpolate_property(self, "modulate", Color(randf(), randf(), randf(), 1.0), Color(1.0, 1.0, 1.0, 1.0), 0.6, $Tween.TRANS_LINEAR, $Tween.EASE_IN)
	$Tween.start()
