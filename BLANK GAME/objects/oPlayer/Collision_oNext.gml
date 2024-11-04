// oNext Collision Event with oPlayer

// Access oQuestionController's last selected answer
var controller = instance_find(oQuestionController, 0); // Assume only one instance of oQuestionController exists

// Ensure the check only happens once per collision until reset
if (!checked_answer && controller != noone && controller.last_selected_answer_index != -1 && array_length(controller.answer_positions) > controller.last_selected_answer_index) {
    // Get the correct answer for the current question
    var correct_answer = controller.questions[controller.current_page].answers[0];
    
    // Check if answer_positions array has the required data
    var selected_answer = controller.answer_positions[controller.last_selected_answer_index].answer;

	show_debug_message( controller.answer_positions[controller.last_selected_answer_index]);
	show_debug_message(correct_answer);

    if (selected_answer == correct_answer) {
        show_debug_message("Correct Answer!");
        show_debug_message(oQuestionController.current_page);
        oQuestionController.current_page += 1;
		controller.last_selected_answer_index = -1;

        // Toggle all instances of oBlocker to be inactive
        with (oBlock) {
			show_debug_message(active)
            active = !active; // Toggle the active state
        }

        // Additional logic for correct answer can go here
    } else {
        show_debug_message("Incorrect Answer!");
        // Additional logic for incorrect answer can go here
    }

    // Mark as checked to prevent repeated checks
    checked_answer = true;
}
