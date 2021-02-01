extends Node2D

#Scene transition
var Load

func changer(path, toLoader, loadType):

	if toLoader:
		Load=loadType
		get_tree().change_scene("res://Scenes/Loader.tscn")
	else:
		get_tree().change_scene(path)

	get_tree().get_root().get_child(get_tree().get_root().get_child_count()-1).queue_free()

#Haus variables
var Coin=0

var IngridArray=[
	[preload("res://Sprites/Ingridients/glowworm.png"), 'GlowWorm', 1],
	[preload("res://Sprites/Ingridients/rat_tail.png"), 'Rat', -1],
	[preload("res://Sprites/Ingridients/clover.png"), 'Clover', 2], 
	[preload("res://Sprites/Ingridients/slug.png"), 'Slug', -2], 
	[preload('res://Sprites/Ingridients/butterfly_wing.png'), 'Butterfly', 3],
	[preload('res://Sprites/Ingridients/toad.png'), 'Toad', -3],
	[preload('res://Sprites/Ingridients/hair_curl.png'), 'Hair', 4],
	[preload('res://Sprites/Ingridients/spider.png'), 'Spider', -4],
	[preload('res://Sprites/Ingridients/rabbit_foot.png'), 'Rabbit', 5],
	[preload('res://Sprites/Ingridients/bat_wing.png'), 'BatWing', -5], 
	[preload('res://Sprites/Ingridients/beads.png'), 'Beads', 6], 
	[preload('res://Sprites/Ingridients/toadstool.png'), 'ToadStool', -6], 
	[preload('res://Sprites/Ingridients/unicorn_horn.png'), 'Unihorn', 7], 
	[preload('res://Sprites/Ingridients/witch_finger.png'), 'Finger', -7], 
	[preload('res://Sprites/Ingridients/werewolf_fang.png'), 'Fang', -8], 
	[preload('res://Sprites/Ingridients/indulgence.png'), 'Indulgence', 9], 
	[preload('res://Sprites/Ingridients/black_lamb.png'), 'BlackLumb', -9],  
]

#Coven variables
var store = { 
		"dog" : [500, 1000, 1500], "dog_upgrades" : [1, 2],
		"garden" : [700, 1500, 3000], "garden_upgrades" : [1, 2],
		"stonehange" : [400, 800, 1200], "stonehange_upgrades" : [1, 2],
		'fairytree' : [400, 800, 1200], "fairytree_upgrades" : [1, 2],
		'graveyard' : [500, 1000, 1500], "graveyard_upgrades" : [1, 2],
		'hedge' : [500, 1000, 1500], "hedge_upgrades" : [1, 2],
		'assistant' : [500, 1000, 1500], "assistant_upgrades" : [1, 2],
		'pot' : [500, 1000, 1500], "pot_upgrades" : [1, 2],
		'demontrap' : [700, 1500, 2500], "demontrap_upgrades" : [1, 2],
		'mushroom' : [700, 1500, 2500], "mushroom_upgrades" : [1, 2],
		"cave" : [400, 800, 1200], "cave_upgrades" : [1, 2]
	}

#Familie Tree variables
var Witches=[]
var NumberOfBrunches=1
var IsDead=false

var WitchNames=['Альба', 'Агнесса', 'Агата', 'Агриппина', 'Адель', 'Анита', 'Анна', 'Анастасия', 'Анжела', 'Алиса', 'Амелия', 'Аурелия', 'Алина', 'Адрианна', 'Барбара', 'Берта', 'Бланш', 'Беатриса', 'Бриджит', 'Валентина', 'Генриетта', 'Гизела', 'Гортензия', 'Гертруда', 'Джейн', 'Жаклин']
var WitchFamilieName=['Щурая', 'Сероглазая', 'Сквернословная', 'Одержимая', 'Провидица', 'Памятливая', 'Неотразимая', 'Большерукая', 'Дряхлая', 'Нерешительная', 'Дурная', 'Забывчивая']



