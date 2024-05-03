class_name Card
extends Object

var id = 0
var name = ""
var description = ""
var mana_cost = [0, 0, 0, 0]
var effects = []
var image = "" 

func _init(_id, _name, _description, _mana_cost, _effects, _image):
	id = _id
	name = _name
	description = _description
	effects = _effects
	image = _image
	
