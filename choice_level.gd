extends Control

func _on_level_1_pressed() -> void:
	Global.prologue_text = "Я не помню, кто я. И где та грань, что отделяла меня от других.\n
		\nНо здесь, в этой темноте, я чувствую: что-то было не зря.\n
		\nЭти сердца...они не мои. В них — чужая боль.\n\nЧужие слёзы. Чужие шаги, оборвавшиеся во тьме.\n
		\nПочему я их вижу? Почему они всё ещё светятся?\n\nМожет быть...если собрать их все...я наконец вспомню, кто я."
	Global.next_scene = "res://level.tscn"
	get_tree().change_scene_to_file("res://Prologue.tscn")

func _on_level_2_pressed() -> void:
	get_tree().change_scene_to_file("res://level_2.tscn")
	
func _on_level_3_pressed() -> void: #НЕ РАБОТАЕТ!!!!
	get_tree().change_scene_to_file("res://level_3.tscn")
	
func _on_level_1_1_pressed() -> void:
	Global.prologue_text = "Я не помню, кто я. Но я помню, как болело.\n\nЧужая боль стала моей. Чужие слёзы - моими.\n\nЯ нёс их так долго, что перестал чувствовать вес.\n\nНо теперь...теперь я чувстсвую другое.\n
	\nТяжесть в груди. Сомнение, страх, что я делаю всё не так.\n\nЧто, если я не стану светом? Что, если тьма внутри меня сильнее?\n\nЯ должен узнать ответ. Даже если он страшнее истины."
	Global.next_scene = "res://level_1_1.tscn"
	get_tree().change_scene_to_file("res://Prologue.tscn")

func _on_level_2_1_pressed() -> void:
	get_tree().change_scene_to_file("res://level_2_1.tscn")
	
func _on_level_3_1_pressed() -> void:
	get_tree().change_scene_to_file("res://level_3_1.tscn")

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://node_2d.tscn")
