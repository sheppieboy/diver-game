extends CanvasLayer

class_name Display

@onready var label = $MarginContainer/Label


func _ready():
	label.text = "%d" % 0

func update_label(gold: int):
	label.text = "%d" % gold


