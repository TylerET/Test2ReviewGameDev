// obj_controller Step Event

// Player's position (replace with actual player object's position variables)
var player_x = oPlayer.x;
var player_y = oPlayer.y;

// Reset selected answer index
selected_answer_index = -1;

// Check for player collision with any answer on the current page
for (var k = 0; k < array_length(answer_positions); k++) {
    var answer_pos = answer_positions[k];

    // Simple collision detection
    if (player_x > answer_pos.x && player_x < answer_pos.x + answer_pos.width &&
        player_y > answer_pos.y && player_y < answer_pos.y + answer_pos.height) {
        
        // Player is touching this answer
        selected_answer_index = k;

        // If player presses "E", mark the answer as selected and output debug message
        if (keyboard_check_pressed(ord("E"))) {
            var selected_answer = answer_pos.answer;
            show_debug_message("Selected Answer: " + string(selected_answer));
            
            // Store the selected answer's index to keep it highlighted
            last_selected_answer_index = k;

            // Handle answer selection logic here, e.g., check if it's correct
        }
        break;  // Exit loop once an answer is found
    }
}
