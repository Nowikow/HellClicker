extends AnimatedSprite

func _process(_delta):
	$CoinText.text=str(Global.Coin)

func AddSomeGold(number):
	Global.Coin+=number

	set_animation('Move')
	play()

func _on_Coin_animation_finished():
	set_animation('Idle')
