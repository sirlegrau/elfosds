extends Node2D

var weapon = load("res://EQUIPMENT/_ITEMS/weapon.tres")
### THIS INT HOLD PLAYER TOTAL HP
var playerHP = 3;

### THIS INT HOLDS PLAYER TOTAL TIME
var sleepyTime = 15;

### THIS DICTIONARY HOLDS PLAYER CURRENT ITEMS  
var loot ={
	### TO BE RENAMED XMAS
	"exp" : 4000,
	"silk" : 4000,
	"honey" :4000
}

### THIS ARRAY HOLDS PLAYER INVENTORY USED ACROSS ALL MACHINES
var inventory = []

### THIS ARRAY HOLDS EQUIPPED ITEMS, RENDERED IN PLAYER.GD _READY()
var wardrobe = []

###this dictionary holds key -> item.name  value -> +1 when crafted in workbench
var timesbought= {
	"baller" = 0,
	"weapon" = 0,
	"WORKBENCH"=0,
	"FORGE"=3
}
