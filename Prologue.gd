extends Control

@onready var text_label = $TextLabel

var full_text = ""
var next_scene = ""
var text_index = 0
var is_typing = false
var skip_requested = false

func _ready():
	if Global.prologue_text != "":
		full_text = Global.prologue_text
		next_scene = Global.next_scene
	else:
		full_text = "Я не помню, кто я. И где та грань, что отделяла меня от других.\n
		\nНо здесь, в этой темноте, я чувствую: что-то было не зря.\n
		\nЭти сердца...они не мои. В них — чужая боль.\n\nЧужие слёзы. Чужие шаги, оборвавшиеся во тьме.\n
		\nПочему я их вижу? Почему они всё ещё светятся?\n\nМожет быть...если собрать их все...я наконец вспомню, кто я."
		next_scene = "res://level.tscn"
	
	start_typing()

func start_typing():
	is_typing = true
	text_label.text = ""
	text_index = 0
	
	while text_index < full_text.length():
		if skip_requested:
			break
		text_label.text += full_text[text_index]
		text_index += 1
		await get_tree().create_timer(0.05).timeout
	
	if skip_requested:
		text_label.text = full_text
	
	is_typing = false
	$AnyKeyLabel.visible = true

func _input(event: InputEvent):
	if is_typing and event.is_pressed():
		skip_requested = true
		return
	
	if not is_typing and event.is_pressed():
		get_tree().change_scene_to_file(next_scene)
