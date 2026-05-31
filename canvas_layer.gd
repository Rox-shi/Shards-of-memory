extends CanvasLayer

@onready var message_label = $Message
var full_text = ""
var text_index = 0
var is_typing = false

func show_message(text: String, duration: float = 3.0):
	# Если уже печатаем — останавливаем
	if is_typing:
		return
	
	full_text = text
	text_index = 0
	message_label.text = ""
	message_label.visible = true
	message_label.modulate.a = 1.0
	
	is_typing = true
	
	# Печатаем по буквам
	while text_index < full_text.length():
		message_label.text += full_text[text_index]
		text_index += 1
		await get_tree().create_timer(0.04).timeout
	
	is_typing = false
	
	# Ждём небольшую задержку
	await get_tree().create_timer(1.0).timeout
	
	# Затухаем
	var tween = create_tween()
	tween.tween_property(message_label, "modulate:a", 0.0, 0.8)
	await tween.finished
	message_label.visible = false
