extends KinematicBody2D

#### Player Properties
var state
var velocity : Vector2 = Vector2()
var lives : int = DataManager.get_lives()
export (int) var MOVE_SPEED = 200 # 200 pixel / sec
var collide
signal player_hit(current_lives)
signal shoot(player_position, bullet)
signal game_over()
var bullet = preload("res://Scenes/Bullet/NormalBullet.tscn")
var can_shoot = true
###################################################
#### Player States
enum states {
	move, dead, hit
}
###################################################

func _ready():
	state = states.move

func _process(delta):
	match state:
		states.move:
			_move(delta)
		states.hit:
			_move(delta)
		states.dead:
			pass
			
func _move(delta):
	velocity = Vector2()
	if Input.is_action_pressed("ui_left") and position.x >= 0:
		velocity.x = -1
	if Input.is_action_pressed("ui_right") and position.x <= 400:
		velocity.x = 1
	if Input.is_action_pressed("ui_up") and position.y >= 300:
		velocity.y = -1
	if Input.is_action_pressed("ui_down") and position.y <= 600:
		velocity.y = 1
	if Input.is_action_pressed("ui_accept"):
		if can_shoot:
			print("shoot")
			shoot()
	collide = move_and_collide(velocity * MOVE_SPEED * delta)


func check_collided_object(collide) -> void:
	if collide != null:
#		print(collide)
		if collide is Enemies:
			collide.queue_free()
			lives -= 1
			emit_signal("player_hit", lives)
			if lives > 0:
				state = states.hit
				$Sprite/AnimationPlayer.play("on_hit")
				yield($Sprite/AnimationPlayer, "animation_finished")
				state = states.move
			else:
				emit_signal("game_over")
				queue_free()

func shoot() -> void:
	can_shoot = false
	var bullet_position = position
	bullet_position.y -= $Sprite.texture.get_height() / 2
	emit_signal("shoot",bullet_position ,bullet)
	$BulletReload.start()

func _on_BulletReload_timeout():
	can_shoot = true


func _on_HitBox_area_entered(area):
	check_collided_object(area)
