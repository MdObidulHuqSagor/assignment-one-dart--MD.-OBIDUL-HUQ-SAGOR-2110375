// Question 4: Inheritance & Polymorphism (Difficulty: 4/5) ⭐⭐⭐⭐
// Requirements:

// 1. Abstract Class Vehicle:
//     - Properties: String brand, String model, int year
//     - Abstract method: void start()
//     - Abstract method: void stop()
//     - Concrete method: void displayInfo()
abstract class Vehicle {
  String brand;
  String model;
  int year;
  
  Vehicle(this.brand, this.model, this.year);
  
  // Abstract methods
  void start();
  void stop();
  
  // Concrete method
  void displayInfo() {
    // Display vehicle information
    print("Vehicle Info: $year $brand $model");
  }
  
  // Add a method to calculate vehicle age (current year - vehicle year)
  int calculateAge() {
    // Calculate and return vehicle age
    return DateTime.now().year - year;
  }
}

// 2. Concrete Classes:
//     - Car extends Vehicle
//       - Additional property: int numberOfDoors
//       - Override start() and stop() methods
class Car extends Vehicle {
  int numberOfDoors;
  
  Car(String brand, String model, int year, this.numberOfDoors) : super(brand, model, year);
  
  @override
  void start() {
    // Implement car start method
    print("Starting the $brand $model's engine...");
  }
  
  @override
  void stop() {
    // Implement car stop method
    print("Stopping the $brand $model's engine...");
  }
  
  @override
  void displayInfo() {
    // Override to show car-specific info
    print("Car Info: $year $brand $model ($numberOfDoors doors)");
  }
}

//     - Motorcycle extends Vehicle
//       - Additional property: bool hasWindshield
//       - Override start() and stop() methods
class Motorcycle extends Vehicle {
  bool hasWindshield;
  
  Motorcycle(String brand, String model, int year, this.hasWindshield) : super(brand, model, year);
  
  @override
  void start() {
    // Implement motorcycle start method
    print("Revving the $brand $model's engine...");
  }
  
  @override
  void stop() {
    // Implement motorcycle stop method
    print("Shutting down the $brand $model's engine...");
  }
  
  @override
  void displayInfo() {
    // Override to show motorcycle-specific info
    String windshieldInfo = hasWindshield ? "with windshield" : "no windshield";
    print("Motorcycle Info: $year $brand $model ($windshieldInfo)");
  }
}

void main() {
  // 3. Create a list of vehicles and demonstrate polymorphism by calling start(), stop(), and displayInfo() on each vehicle
  // Create a list of vehicles
  List<Vehicle> vehicles = [
    Car("Toyota", "Camry", 2020, 4),
    Motorcycle("Honda", "CBR", 2021, true),
    Car("Ford", "Mustang", 1969, 2),
    Motorcycle("Harley-Davidson", "Iron 883", 2019, false),
  ];
  
  // Demonstrate polymorphism
  for (Vehicle vehicle in vehicles) {
    // The correct displayInfo() is called based on the object's actual type
    vehicle.displayInfo();
    
    // The correct start() and stop() methods are called
    vehicle.start();
    vehicle.stop();
    
    // The base class method is available to all
    print("${vehicle.brand} age: ${vehicle.calculateAge()} years");
    print(""); // Add a blank line for spacing
  }
}