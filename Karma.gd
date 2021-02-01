extends HSlider

func _process(_delta):
	$TestLabel.text=str(value)
