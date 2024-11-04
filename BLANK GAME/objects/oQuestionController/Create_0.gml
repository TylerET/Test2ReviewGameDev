// obj_controller Create Event
questions_per_page = 1;  // Display one question per page for simplicity
current_page = 0;        // Start on the first page
last_selected_answer_index = -1;  // To track the last selected answer

// Define questions with the correct answer as the first element in each answers array
questions = [
    { question_text: "Question 1", answers: [" 1 is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley", " 2 is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley", "3 is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley", "4 is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley"] },
    { question_text: "Question 2", answers: ["B1", "B2", "B3", "B4"] },
    // Add more questions as needed
];

randomOrderQuestions = questions;
randomizeOrder(randomOrderQuestions)


answer_positions = [];  // Array to store answer positions for collision checking
selected_answer_index = -1;  // To track which answer is currently highlighted by the player
