extends CharacterBody2D

const SPEED = 185.0
const JUMP_VELOCITY = -340.0
const CLIMB_SPEED = 100.0
var health = 100

var last_direction = 1
@onready var anim = $AnimatedSprite2D
var is_climbing = false
var is_moving_up = false
var is_moving_down = false

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		anim.play("jump")

	var direction := Input.get_axis("Left", "Right")
	if direction:
		velocity.x = direction * SPEED
		if velocity.y == 0:
			anim.play("run_1")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if velocity.y == 0:
			anim.play("idle")
		
	if direction != 0:
		last_direction = direction
		
	if last_direction == -1:
		$AnimatedSprite2D.flip_h = true
	else:
		$AnimatedSprite2D.flip_h = false
		
	if is_on_wall() and not is_on_floor():
		is_climbing = true
		velocity.y = 0
		
		if Input.is_action_pressed('Climb wall'):
			velocity.y = -CLIMB_SPEED
			is_moving_up = true
			is_moving_down = false
		elif Input.is_action_pressed('Climb_down wall'):
			velocity.y = CLIMB_SPEED
			is_moving_down = true
			is_moving_up = false
		else:
			is_moving_up = false
			is_moving_down = false
	else:
		is_climbing = false
		is_moving_up = false
		is_moving_down = false
		
	if is_climbing:
		if is_moving_up:
			anim.play('climb wall')
			anim.speed_scale = 1.0
		elif is_moving_down:
			anim.play('climb wall')
			anim.speed_scale = -1.0
		else:
			anim.play('grab wall')
			anim.speed_scale = 1.0
	else:
		anim.speed_scale = 1.0
	
	if health <= 0:
		die()
	
	move_and_slide()

func take_damage(amount: int):
	health -= amount

func die():
	get_tree().reload_current_scene()  # перезапуск уровня
