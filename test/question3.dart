// Question 3: Classes & Objects (Difficulty: 3/5) ⭐⭐⭐
// Requirements:

// Create a BankAccount class with the following specifications:
class BankAccount {
  // 1. Properties:
  String accountNumber;
  String accountHolder;
  double balance;
  String accountType; // Savings/Checking
  
  // 2. Constructor:
  //     - Initialize all properties
  //     - Set initial balance to 0.0
  BankAccount(this.accountNumber, this.accountHolder, this.accountType) : balance = 0.0;
  
  // 3. Methods:
  //     - deposit(double amount): Add money to account
  void deposit(double amount) {
    if (amount > 0) {
      balance += amount;
      print("Deposited: \$${amount.toStringAsFixed(2)}. New balance: \$${balance.toStringAsFixed(2)}");
    } else {
      print("Error: Deposit amount must be positive.");
    }
  }
  
  //     - withdraw(double amount): Remove money from account (check for sufficient funds)
  void withdraw(double amount) {
    if (amount <= 0) {
      print("Error: Withdrawal amount must be positive.");
    } else if (balance >= amount) {
      balance -= amount;
      print("Withdrew: \$${amount.toStringAsFixed(2)}. New balance: \$${balance.toStringAsFixed(2)}");
    } else {
      print("Error: Insufficient funds for withdrawal of \$${amount.toStringAsFixed(2)}.");
      print("       Available balance: \$${balance.toStringAsFixed(2)}");
    }
  }
  
  //     - getBalance(): Return current balance
  double getBalance() {
    return balance;
  }
  
  //     - displayAccountInfo(): Show account details
  void displayAccountInfo() {
    print("\n--- Account Details ---");
    print("  Account Holder: $accountHolder");
    print("  Account Number: $accountNumber");
    print("  Account Type: $accountType");
    print("  Current Balance: \$${balance.toStringAsFixed(2)}");
    print("-------------------------");
  }
}

void main() {
  // 4. Create 3 bank accounts and demonstrate:
  //     - Depositing money
  //     - Withdrawing money
  //     - Displaying account information
  //     - Handling insufficient funds scenario
  
  print("--- Creating Accounts ---");
  BankAccount account1 = BankAccount("12345", "Alice", "Savings");
  BankAccount account2 = BankAccount("67890", "Bob", "Checking");
  BankAccount account3 = BankAccount("11111", "Charlie", "Savings");
  
  print("\n--- Demonstrating Deposits ---");
  account1.deposit(1000.0);
  account2.deposit(500.0);
  account3.deposit(2000.0);
  
  print("\n--- Demonstrating Withdrawals ---");
  account1.withdraw(200.0);
  account2.withdraw(100.0);
  
  print("\n--- Displaying Account Information ---");
  account1.displayAccountInfo();
  account2.displayAccountInfo();
  account3.displayAccountInfo();
  
  print("\n--- Demonstrating Insufficient Funds ---");
  account2.withdraw(1000.0); // This should show insufficient funds message
}