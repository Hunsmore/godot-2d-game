extends Node

export(PackedScene) var mob_scene
var score

func _ready():
	randomize()
	new_game()

func game_over():
	$ScoreTimer.stop()
	$MobTimer.stop()

func new_game():
	score = 0
	$Player.start($StartPosition.position)
	$StartTimer.start()

func _on_ScoreTimer_timeout():
	score += 1 # Replace with function body.


func _on_StartTimer_timeout():
	$ScoreTimer.start()
	$MobTimer.start()


func _on_MobTimer_timeout():
	print(1)
	var mob = mob_scene.instance()
	var mob_spawn_location = get_node("Path2D/PathFollow2D")
	mob_spawn_location.offset = randi()
	var direction = mob_spawn_location.rotation + PI / 2
	mob.position = mob_spawn_location.position
	print(mob_spawn_location.position)
	direction += rand_range(-PI / 4, PI / 4)
	mob.rotation = direction
	var velocity = Vector2(rand_range(150.0, 250.0), 0.0)
	mob.linear_velocity = velocity.rotated(direction)
	add_child(mob)
