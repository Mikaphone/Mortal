extends Node2D

func playsound():
	$hitsound.play()
	await get_tree().create_timer(.5).timeout
	$hitsound.play()

func flip():
	$AnimatedSprite2D.set_flip_h(true)
	$AnimatedSprite2D.set_flip_v(true)
