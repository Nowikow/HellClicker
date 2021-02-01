extends ProgressBar

func _process(delta):
	$TestLabel.text=str(int(value))
	value-=delta

func _on_ManaButton_pressed():
	value+=2
