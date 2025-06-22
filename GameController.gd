extends Node

# A list of dictionaries for each question
var question_data = [
	{
		"question": "What is the synonym of 'happy'?",
		"options": ["sad", "joyful", "angry", "cold"],
		"answer": "joyful"
	},
	{
		"question": "What does 'benevolent' mean?",
		"options": ["evil", "kind", "lazy", "smart"],
		"answer": "kind"
	},
	{
		"question": "What is the synonym of 'happy'?",
		"options": ["sad", "joyful", "angry", "cold"],
		"answer": "joyful"
	}
]

var current_question = null

#connecting button
@onready var question_label = $Path/To/QuestionLabel
@onready var answer_buttons = [
	$Path/To/AnswerButton1,
	$Path/To/AnswerButton2,
	$Path/To/AnswerButton3,
	$Path/To/AnswerButton4
	]
	
#shuffle the questions
func show_new_question():
	current_question = question_data[randi() % question_data.size()]
	question_label.text = current_question["question"]
	
	var shuffled_options = current_question["options"].duplicate()
	shuffled_options.shuffle()
	
	for i in range(answer_buttons.size()):
		answer_buttons[i].text = shuffled_options[i]
		answer_buttons[i].disabled = false



func _on_answer_button_pressed():
	var pressed_button = get_tree().get_sender() as Button
	var chosen_text = pressed_button.text
	
	if chosen_text == current_question["answer"]:
		print("✅ Correct!")
		enter_battle_mode()
	else:
		print("❌ Wrong!")
		show_new_question()


#Change bottom ui
@onready var battle_ui = $Path/To/BattleUI

func enter_battle_mode():
	battle_ui.visible = true
	for button in answer_buttons:
		button.disabled = true

func return_to_question_mode():
	battle_ui.visible = false
	show_new_question()
