// Question 1: Basic Data Types & Functions (Difficulty: 1/5) ⭐
// Requirements:

// 1. Create variables of different data types: String, int, double, bool
String name = ""; // Initialized in main
int age = 0; // Initialized in main
double height = 0.0; // Initialized in main
bool isStudent = false; // Initialized in main

// 2. Write a function called calculateBMI that takes weight (double) and height (double) as parameters and returns the BMI as a double
double calculateBMI(double weight, double height) {
  // Calculate BMI = weight / (height * height)
  // Added a check to prevent division by zero
  if (height <= 0) {
    return 0.0;
  }
  return weight / (height * height);
}

// 3. Write a function called getGrade that takes a score (int) and returns a grade (String) based on:
//     - 90-100: A
//     - 80-89: B
//     - 70-79: C
//     - 60-69: D
//     - Below 60: F
String getGrade(int score) {
  if (score >= 90) {
    return "A";
  } else if (score >= 80) {
    return "B";
  } else if (score >= 70) {
    return "C";
  } else if (score >= 60) {
    return "D";
  } else {
    return "F";
  }
}

void main() {
  // Initialize your variables with appropriate values
  name = "John Doe";
  age = 25;
  height = 5.9; // Assuming height is in feet for this example
  isStudent = true;
  
  // Calculate BMI and grade
  // Note: BMI calculation is sensitive to units. 
  // If height is 5.9ft and weight is 150lbs, the formula is (weight / (height * height)) * 703
  // For simplicity, we'll assume the units are metric (kg, m) or the formula is simplified.
  // Let's assume 150.0 is weight in kg and 5.9 is height in meters for this function.
  // A more realistic metric example: 70kg, 1.75m height
  double weightInKg = 70.0;
  double heightInMeters = 1.75;
  
  // Using the example values from the TODO, but be mindful of units in a real app
  double bmi = calculateBMI(150.0, height); 
  String grade = getGrade(85); // Example score
  
  // Use string interpolation to display the results
  print("Name: $name, Age: $age, Height: $height, Is Student: $isStudent");
  
  // Using .toStringAsFixed(2) to format the BMI to 2 decimal places
  print("BMI: ${bmi.toStringAsFixed(2)}");
  print("Grade: $grade");

  // --- Example with more realistic metric values ---
  print("\n--- Metric Example ---");
  double metricBMI = calculateBMI(weightInKg, heightInMeters);
  print("Weight: $weightInKg kg, Height: $heightInMeters m");
  print("Metric BMI: ${metricBMI.toStringAsFixed(2)}");
}