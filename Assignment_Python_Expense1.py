# expense_tracker.py
 
# Define the Expense class

class Expense:

    def __init__(self, expense_id, date, category, description, amount):

        self.expense_id = expense_id

        self.date = date

        self.category = category

        self.description = description

        self.amount = amount
 
    def __str__(self):

        return f"Expense ID: {self.expense_id}, Date: {self.date}, Category: {self.category}, Description: {self.description}, Amount: {self.amount}"
 
# Data Storage

expenses = []
 
def add_expense(expense):

    expenses.append(expense)
 
def update_expense(expense_id, new_expense):

    for i, expense in enumerate(expenses):

        if expense.expense_id == expense_id:

            expenses[i] = new_expense

            break
 
def delete_expense(expense_id):

    for i, expense in enumerate(expenses):

        if expense.expense_id == expense_id:

            del expenses[i]

            break
 
def display_expenses():

    for expense in expenses:

        print(expense)
 
# User Authentication

users = {

    "Sravani": "Sravani@21",

    "Parvathi": "Paru@14",

    "Divya": "Divya@13"

}
 
def authenticate_user(username, password):

    if username in users and users[username] == password:

        print("Authentication successful!")

        return True

    else:

        print("Invalid username or password. Please try again.")

        return False
 
# Categorization and Summarization

def categorize_expenses():

    categories = {}

    for expense in expenses:

        if expense.category not in categories:

            categories[expense.category] = 0

        categories[expense.category] += expense.amount

    return categories
 
def summarize_expenses():

    total = 0

    for expense in expenses:

        total += expense.amount

    return total
 
# Functions for Repetitive Tasks

def calculate_total_expenses():

    return sum(expense.amount for expense in expenses)
 
def generate_summary_report():

    categories = categorize_expenses()

    for category, amount in categories.items():

        print(f"Category: {category}, Total: {amount}")

    print(f"Total Expenses: {calculate_total_expenses()}")
 
# Simple CLI for Interaction

def cli():

    if authenticate_user(input("Enter username: "), input("Enter password: ")):

        while True:

            print("\nMenu:")

            print("1. Add expense")

            print("2. Update expense")

            print("3. Delete expense")

            print("4. Display expenses")

            print("5. Generate summary report")

            print("6. Exit")
 
            choice = input("Enter your choice: ")
 
            if choice == "1":

                expense_id = int(input("Enter expense ID: "))

                date = input("Enter date: ")

                category = input("Enter category: ")

                description = input("Enter description: ")

                amount = float(input("Enter amount: "))

                add_expense(Expense(expense_id, date, category, description, amount))

                print("Expense added successfully!")
 
            elif choice == "2":

                expense_id = int(input("Enter expense ID: "))

                date = input("Enter date: ")

                category = input("Enter category: ")

                description = input("Enter description: ")

                amount = float(input("Enter amount: "))

                update_expense(expense_id, Expense(expense_id, date, category, description, amount))

                print("Expense updated successfully!")
 
            elif choice == "3":

                expense_id = int(input("Enter expense ID: "))

                delete_expense(expense_id)

                print("Expense deleted successfully!")
 
            elif choice == "4":

                display_expenses()
 
            elif choice == "5":

                generate_summary_report()
 
            elif choice == "6":

                print("Goodbye!")

                break
 
            else:

                print("Invalid choice. Please try again.")
 
if __name__ == "__main__":

    cli()