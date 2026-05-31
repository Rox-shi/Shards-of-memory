extends Area2D

var activated = false

func _on_body_entered(body: Node2D) -> void:
	
	if body.name == "Player" and not activated:
		
		var counter = get_tree().get_first_node_in_group("score_label")
		var enemy = get_node_or_null("$../Mobs/Enemy")
		
		if counter and counter.score >= 10 and enemy == null:
			activated = true
			set_deferred("monitoring", false)
			$AnimatedSprite2D.play("idle")
			await $AnimatedSprite2D.animation_finished
			
			# Проверяем уровень ПОСЛЕ анимации
			var current_level = get_tree().current_scene.name
			
			if current_level == "level_3":
				Global.prologue_text = "Я собрал их все. Все сердца. Но память не вернулась.\n\nЯ всё так же не знаю, кем являюсь, но знаю другое.\n
				\nКаждое сердце, которое я нёс в себе, перестало болеть.\n
				\nЧья-то тьма стала светлее. И, может быть...\n
				\n...быть светом для других - это и есть моё истинное имя."
				Global.next_scene = "res://choice_level.tscn"
				get_tree().change_scene_to_file("res://Prologue.tscn")
				
			elif current_level == "level3_1":
				Global.prologue_text = "Я думал, что главное - собрать чужие сердца.\nНо настоящая битва была внутри.\n
				Я победил не монстра. Я победил свою усталость.\nСвоё 'я ничего не значу', своё 'я не справлюсь'.\n
				\nТеперь я могу идти дальше.\n
				Не потому, что должен, а потому что выбираю свет.\n
				\nЯ не помню, кто я. Но знаю, кем хочу быть.\nТем, кто зажигает свет даже в самой глубокой тьме."
				Global.next_scene = "res://choice_level.tscn"
				get_tree().change_scene_to_file("res://Prologue.tscn")
			else:
				get_tree().change_scene_to_file("res://level_complete_screen.tscn")
