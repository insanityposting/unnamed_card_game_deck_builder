extends Card

class_name Unit
var attack = 0
var health = 0
var attributes = []
var tribes = []

func _init(_id, _name, _description, _tribes, _mana_cost, _attack, _healh, _attributes, _effects, _image):
	super(_id, _name, _description, _mana_cost, _effects, _image)
	tribes = _tribes
	attack = _attack
	health = _healh
	attributes = _attributes
