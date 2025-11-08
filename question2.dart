// Question 2: Collections & Control Flow (Difficulty: 2/5) ⭐⭐
// Requirements:

import 'dart:math';

void main() {
  // 1. Create a List<String> of student names: ["Alice", "Bob", "Charlie", "Diana", "Eve"]
  List<String> studentNames = ["Alice", "Bob", "Charlie", "Diana", "Eve"];
  
  // 2. Create a Map<String, int> to store student scores
  Map<String, int> studentScores = {};
  
  // 3. Use a for loop to assign random scores (60-100) to each student
  Random random = Random();
  
  // 4. Find and display:
  //     - The student with the highest score
  //     - The student with the lowest score
  //     - The average score of all students
  String highestStudent = "";
  int highestScore = 0; // Start at 0, any score will be higher
  String lowestStudent = "";
  int lowestScore = 101; // Start above max, any score will be lower
  double totalScore = 0.0;
  
  // Loop to assign scores and find stats in one pass
  for (String student in studentNames) {
    // Generate a random score between 60 and 100
    // random.nextInt(41) gives a number from 0-40
    // Adding 60 shifts the range to 60-100
    int score = random.nextInt(41) + 60;
    studentScores[student] = score;
    
    totalScore += score;
    
    // Check for highest score
    if (score > highestScore) {
      highestScore = score;
      highestStudent = student;
    }
    
    // Check for lowest score
    if (score < lowestScore) {
      lowestScore = score;
      lowestStudent = student;
    }
  }
  
  // Calculate average
  double averageScore = 0.0;
  if (studentNames.isNotEmpty) {
    averageScore = totalScore / studentNames.length;
  }
  
  print("Student Scores: $studentScores");
  print("Highest Score: $highestStudent with $highestScore");
  print("Lowest Score: $lowestStudent with $lowestScore");
  // Format average to 2 decimal places
  print("Average Score: ${averageScore.toStringAsFixed(2)}");
  print("\n--- Student Categories ---");
  
  // 5. Use a switch statement to categorize students:
  //     - 90-100: "Excellent"
  //     - 80-89: "Good"
  //     - 70-79: "Average"
  //     - Below 70: "Needs Improvement"
  for (String student in studentNames) {
    int score = studentScores[student] ?? 0;
    String category = "";
    
    // Use integer division ( ~/ ) to get the "tens" digit
    switch (score ~/ 10) {
      case 10: // 100
      case 9: // 90-99
        category = "Excellent";
        break;
      case 8: // 80-89
        category = "Good";
        break;
      case 7: // 70-79
        category = "Average";
        break;
      default: // 60-69 (and anything lower, though our min is 60)
        category = "Needs Improvement";
    }
    
    print("$student: $score ($category)");
  }
}