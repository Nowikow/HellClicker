extends Node2D

signal is_key_answer
signal EndOfEvent

var TypeOfEvent

var CurrentEvent
var IsAnswer
var events = Global.event_creator()

func _ready():
	match TypeOfEvent:
		'RandomEvent':
			randomize()
			CurrentEvent = events[randi() % events.keys().size()]
		'StartOfTheGame':
			CurrentEvent=Global.GameStart

	var CurrentEventAnimation = CurrentEvent["Animation"]
		
	$EventPerson.set_animation(CurrentEventAnimation)
	$EventPaper/Label.text = CurrentEvent["Question"]
	IsAnswer = CurrentEvent["Is Answer"]
			
	$EventPerson.Mover(Vector2(30,0),false)
	$EPAnimationIn.play("AnimIn")

#if IsAnswer == false, start Event, if not, start Random Key Event
func _on_EventPaper_event_paper_out():
	if IsAnswer == true:
		emit_signal("is_key_answer")
		if $EventPaper.position < Vector2(0.0, 1305.0):
			key_event("PositiveAnswer", "PositiveEffect")
		if $EventPaper.position > Vector2(0.0, 1305.0):
			key_event("NegativeAnswer", "NegativeEffect")
		
	if IsAnswer == false:
		$EventPerson.Mover(Vector2(1200, 0), true)
		$EPAnimationOut.play("AnimOut")

		if $EventPaper.position < Vector2(0.0, 1305.0):
			if TypeOfEvent=='StartOfTheGame':
				Global.Coin=0

		elif $EventPaper.position > Vector2(0.0, 1305.0):
			$Effect.text = CurrentEvent["NegativeEffect"]
	
	emit_signal("EndOfEvent")

#Random Key Event
func key_event(answer, effect):
	$AnswerPaper/Label.text = CurrentEvent[answer][randi() % CurrentEvent[answer].size()]
	$Effect.text = CurrentEvent[effect][randi() % CurrentEvent[effect].size()]

func _on_EPAnimationIn_animation_finished(anim_name):
	$PaperIn.play("AnimIn")

func _on_EventPerson_Exit():
	queue_free()
