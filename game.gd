extends Node

var main
var coinCount
var timerCount
var coins = 0
var timer = 0

func _ready() -> void:
	pass # Replace with function body.

func addCoins(qty = 1):
	coins += qty
	coinCount.text = str(coins).pad_zeros(2)
