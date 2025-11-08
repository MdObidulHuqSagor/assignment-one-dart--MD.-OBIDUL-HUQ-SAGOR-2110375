// Question 5: Advanced Features & Mixins (Difficulty: 5/5) ⭐⭐⭐⭐⭐
// Requirements:

// ignore: unused_import
import 'dart:math';

// 1. Mixin Payable:
//     - Method: double calculateSalary(double baseSalary, double bonus)
//     - Method: void processPayment(double amount)
mixin Payable {
  double calculateSalary(double baseSalary, double bonus) {
    // Calculate total salary (base + bonus)
    return baseSalary + bonus;
  }
  
  void processPayment(double amount, String employeeName) {
    // Process payment
    print("Processing payment of \$${amount.toStringAsFixed(2)} for $employeeName...");
    print("Payment completed.");
  }
}

// 2. Mixin Reportable:
//     - Method: String generateReport(String employeeName, String department)
mixin Reportable {
  String generateReport(String employeeName, String department) {
    // Generate report
    String timestamp = DateTime.now().toIso8601String();
    return """
---------------------------------
    PERFORMANCE REPORT
---------------------------------
Employee:   $employeeName
Department: $department
Date:       $timestamp
Status:     All targets met.
---------------------------------
""";
  }
}

// 3. Abstract Class Employee:
//     - Properties: String name, String id, String department
//     - Abstract method: String getJobTitle()
//     - Abstract method: double getBaseSalary()
abstract class Employee {
  String name;
  String id;
  String department;
  
  Employee(this.name, this.id, this.department);
  
  String getJobTitle();
  double getBaseSalary();
  
  void displayInfo() {
    print("\n--- Employee Info ---");
    print("  Name: $name (ID: $id)");
    print("  Department: $department");
    print("  Job Title: ${getJobTitle()}");
    print("  Base Salary: \$${getBaseSalary().toStringAsFixed(2)}");
  }
}

// 4. Concrete Classes:
//     - Manager extends Employee with Payable and Reportable
//       - Additional property: int teamSize
//       - Override required methods
class Manager extends Employee with Payable, Reportable {
  int teamSize;
  
  Manager(String name, String id, String department, this.teamSize) : super(name, id, department);
  
  @override
  String getJobTitle() {
    // Return manager job title
    return "Manager";
  }
  
  @override
  double getBaseSalary() {
    // Return manager base salary
    // (e.g., base salary + bonus per team member)
    return 80000.0 + (teamSize * 1000.0);
  }
  
  @override
  void displayInfo() {
    // Override to show manager-specific info
    super.displayInfo(); // Call parent method
    print("  Team Size: $teamSize");
  }
}

//     - Developer extends Employee with Payable
//       - Additional property: String programmingLanguage
//       - Override required methods
class Developer extends Employee with Payable {
  String programmingLanguage;
  
  Developer(String name, String id, String department, this.programmingLanguage) : super(name, id, department);
  
  @override
  String getJobTitle() {
    // Return developer job title
    return "Developer";
  }
  
  @override
  double getBaseSalary() {
    // Return developer base salary
    return 60000.0;
  }
  
  @override
  void displayInfo() {
    // Override to show developer-specific info
    super.displayInfo(); // Call parent method
    print("  Primary Language: $programmingLanguage");
  }
}

void main() {
  // 5. Create employees and demonstrate:
  //     - Salary calculation with bonus
  //     - Payment processing
  //     - Report generation (for managers)
  //     - Display all employee information
  
  // Create employees
  Manager manager = Manager("Alice", "M101", "Engineering", 12);
  Developer developer = Developer("Bob", "D202", "Engineering", "Dart");
  
  List<Employee> employees = [manager, developer];
  
  // Display employee information
  print("--- Displaying Employee Information ---");
  for (var emp in employees) {
    emp.displayInfo();
  }
  
  // Demonstrate salary calculation with bonus
  print("\n--- Payroll Processing ---");
  double managerBonus = 15000.0;
  double developerBonus = 5000.0;
  
  double managerSalary = manager.calculateSalary(manager.getBaseSalary(), managerBonus);
  double developerSalary = developer.calculateSalary(developer.getBaseSalary(), developerBonus);
  
  print("Calculating ${manager.name}'s Salary: \$${manager.getBaseSalary().toStringAsFixed(2)} (base) + \$${managerBonus.toStringAsFixed(2)} (bonus) = \$${managerSalary.toStringAsFixed(2)} (total)");
  print("Calculating ${developer.name}'s Salary: \$${developer.getBaseSalary().toStringAsFixed(2)} (base) + \$${developerBonus.toStringAsFixed(2)} (bonus) = \$${developerSalary.toStringAsFixed(2)} (total)");
  
  // Demonstrate payment processing
  print("\n--- Processing Payments ---");
  manager.processPayment(managerSalary, manager.name);
  developer.processPayment(developerSalary, developer.name);
  
  // Demonstrate report generation (for managers)
  print("\n--- Generating Reports ---");
  // This line works because 'manager' has the 'Reportable' mixin
  String report = manager.generateReport(manager.name, manager.department);
  print(report);
  
  // This line would cause a compile error, as Developer does not have the Reportable mixin:
  // String devReport = developer.generateReport(developer.name, developer.department);
}