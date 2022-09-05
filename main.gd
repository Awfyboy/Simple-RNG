extends Control

var max_num: int = 20

onready var title := $VBoxContainer/Title
onready var number := $VBoxContainer/Number
onready var result := $VBoxContainer/Result
onready var input := $VBoxContainer/Input

# We change the title to the input maximum number value in the input field. Note-
# that 'is_valid_integer()' function returns a boolean value to check if the input-
# number is an integer. If it isn't, the title simply states max_num as unknown.
func _process(delta):
	if input.text.is_valid_integer():
		max_num = int(input.text)
		title.text = "Find a number between 0 and %d" % max_num
	else:
		title.text = "Find a number between 0 and ???"

# This function generates a number between 0 and max_num and updates 'Result' to-
# indicate whether the number is odd or even. Again, this checks whether the input-
# number is an integer and notifies if it isn't.
func _on_Button_pressed():
	if input.text.is_valid_integer():
		var num = randi() % max_num + 1
		number.text = str(num)
		if num % 2 == 0:
			result.text = "The number %d is even" % num
		else:
			result.text = "The number %d is odd" % num
	else:
		number.text = "???"
		result.text = "Maximum number not recognized! Please input an appropriate integer value."
