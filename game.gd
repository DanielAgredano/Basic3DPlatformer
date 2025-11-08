extends Node

var main
var player
var coinCount
var timerCount
var coins = 0
var timer = 0

func _ready() -> void:
	pass

func addCoins(qty = 1):
	coins += qty
	coinCount.text = "x"+str(coins).pad_zeros(2)
