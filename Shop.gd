extends TextureRect

func InfoShow():
	yield(get_tree().create_timer(.2), "timeout")
	$Info.show()
	$Info/InfoText.text=Global.ButtonTypeArray[Global.ButtonType]
