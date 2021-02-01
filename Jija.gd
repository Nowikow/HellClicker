extends Sprite

func ChangeColor():
	$Tween.interpolate_property(self, "modulate", Color(get_modulate()), Color(randf(), randf(), randf(), 1.0), 1, $Tween.TRANS_LINEAR, $Tween.EASE_OUT)
	$Tween.start()
