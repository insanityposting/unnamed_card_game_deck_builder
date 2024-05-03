extends FlowContainer

var referenced_card = Card

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	

func assign_card(_referenced_card) -> void:
	referenced_card = _referenced_card
	# populate image texture
	var image_path = referenced_card.get("image")
	var image = Image.load_from_file(image_path) # load texture
	var texture = ImageTexture.create_from_image(image)
	var texturerect = self.find_child("CardTexture")
	texturerect.texture = texture # set texture

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _init() -> void:
	pass
