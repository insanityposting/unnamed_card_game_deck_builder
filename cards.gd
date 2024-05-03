extends Control

var json = JSON.new();
var path = ["res://units.json", "res://spells.json"];
var cards = []
var tribes = {} # contains tribe name as key and id for cards of that tribe in an array as values
var attributes = {} # contains attribute as key and id for cards of that attribute in an array as values

var card_prefab_objects = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	load_cards()
	var cardprefab_resource = load("res://card_prefab.tscn")
	var card_menu = $CardScroll/CardMenu
	for card in cards:
		var new_card_prefab = cardprefab_resource.instantiate()
		
		card_prefab_objects.append(new_card_prefab)
		card_menu.add_child(new_card_prefab)
		new_card_prefab.assign_card(card)
	
	var testModuleArr = []
	for i in range(0, 3):
		testModuleArr.append(ProjectSettings.globalize_path(cards[0].get("image")))
	
	var magick = ImageMagick.new()
	magick.generate_a4_page(testModuleArr, ProjectSettings.globalize_path("user://out.png"))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# initialize card array
func load_cards() -> void:
	var file_text = FileAccess.get_file_as_string(path[0])
	print(file_text)
	var unit_json = json.parse_string(file_text)
	
	# add card object for every element
	for el in unit_json:
		
		# add id to tribe dict
		for tribe in unit_json[el]["Tribes"]:
			if tribe not in tribes:
				tribes[tribe] = [int(el)]
			else:
				tribes[tribe].append(int(el))			
		# add id to attribute dict
		for attribute in unit_json[el]["Attributes"]:
			if attribute not in attributes:
				attributes[attribute] = [int(el)]
			else:
				attributes[attribute].append(int(el))
		
		# create card object and append it to the array
		var unit = Unit.new(int(el), unit_json[el]["Name"], unit_json[el]["Description"], unit_json[el]["Tribes"], unit_json[el]["Mana Cost"], unit_json[el]["Attack"], unit_json[el]["Health"], unit_json[el]["Attributes"], unit_json[el]["Effects"], unit_json[el]["Image"])
		cards.append(unit)
