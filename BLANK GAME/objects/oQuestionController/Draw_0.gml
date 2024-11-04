// obj_controller Draw Event
var base_x = room_width / 2;           // Starting x position for questions
var base_y = room_height / 2 - 350;    // Adjusted y position for questions
var question_spacing = 300;            // Horizontal spacing between questions
var answer_spacing_x = 150;            // Horizontal spacing between answers in the grid
var answer_spacing_y = 60;             // Vertical spacing between rows in the grid
var answer_base_x_offset = base_x;


answer_positions = [];  // Clear the array at the start of each draw

// Calculate the indices for the current page
var start_index = current_page * questions_per_page;
var end_index = min(start_index + questions_per_page, array_length(questions));

// Display the subset of questions for the current page
for (var i = start_index; i < end_index; i++) {
    var q = randomOrderQuestions[i];
    var question_x = base_x + (i - start_index) * question_spacing;

    // Draw the question text with an outline
    draw_set_color(c_black);  // Set color to black for outline
    draw_set_font(fBig);      // Set the font to a larger size
    draw_text(question_x - 1, base_y - 1, q.question_text);
    draw_text(question_x + 1, base_y - 1, q.question_text);
    draw_text(question_x - 1, base_y + 1, q.question_text);
    draw_text(question_x + 1, base_y + 1, q.question_text);

    draw_set_color(c_white);  // Set color to white for the main text
    draw_text(question_x, base_y, q.question_text);

    // Offset to start displaying answer texts
    var answer_text_y = base_y + 120;

    // Define labels and draw full answer texts
    var answer_labels = ["A", "B", "C", "D"];
    for (var j = 0; j < 4; j++) {
        var full_answer_text = answer_labels[j] + ": " + q.answers[j];

        // Draw the full answer text with an outline
        draw_set_color(c_black);
        draw_text(question_x - 1 - answer_base_x_offset, answer_text_y - 1 + j * 90, full_answer_text);
        draw_text(question_x + 1 - answer_base_x_offset, answer_text_y - 1 + j * 90, full_answer_text);
        draw_text(question_x - 1 - answer_base_x_offset, answer_text_y + 1 + j * 90, full_answer_text);
        draw_text(question_x + 1 - answer_base_x_offset, answer_text_y + 1 + j * 90, full_answer_text);

        draw_set_color(c_white);
        draw_text(question_x - answer_base_x_offset, answer_text_y + j * 90, full_answer_text);
    }

    // Offset for the 2x2 grid below the full answer texts
    var grid_y = answer_text_y + 435;

    // Draw the 2x2 grid with labels only (A, B, C, D)
    for (var k = 0; k < 4; k++) {
        var answer_x = question_x + (k % 2) * answer_spacing_x;
        var answer_y = grid_y + (k div 2) * answer_spacing_y;

        // Draw grid answer label with a black outline
        draw_set_color(c_black);
        draw_text(answer_x - 1, answer_y - 1, answer_labels[k]);
        draw_text(answer_x + 1, answer_y - 1, answer_labels[k]);
        draw_text(answer_x - 1, answer_y + 1, answer_labels[k]);
        draw_text(answer_x + 1, answer_y + 1, answer_labels[k]);

        draw_set_color(c_white);
        draw_text(answer_x, answer_y, answer_labels[k]);

        // Store the position and dimensions of each answer for collision detection
        answer_positions[(i - start_index) * 4 + k] = { x: answer_x, y: answer_y, width: 100, height: 30, answer: k };

        // Highlight the last selected answer in lime green with 0.5 opacity
        if ((i - start_index) * 4 + k == last_selected_answer_index) {
            draw_set_alpha(0.5);
            draw_rectangle_color(answer_x, answer_y, answer_x + 100, answer_y + 30, c_lime, c_lime, c_lime, c_lime, false);
            draw_set_alpha(1);
        }
        
        // Highlight the currently selected answer in yellow with 0.5 opacity
        else if ((i - start_index) * 4 + k == selected_answer_index) {
            draw_set_alpha(0.5);
            draw_rectangle_color(answer_x, answer_y, answer_x + 100, answer_y + 30, c_yellow, c_yellow, c_yellow, c_yellow, false);
            draw_set_alpha(1);
        }
    }
}
