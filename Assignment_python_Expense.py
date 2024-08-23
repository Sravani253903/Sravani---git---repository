class Expense:
    def __init__(self, expense_id, date, category, description, amount):
        self.expense_id = expense_id
        self.date = date
        self.category = category
        self.description = description
        self.amount = amount

    def __str__(self):
        return f"Expense ID: {self.expense_id}, Date: {self.date}, Category: {self.category}, Description: {self.description}, Amount: {self.amount}"

expenses = []

def add_expense(expense):
    expenses.append(expense)

def update_expense(expense_id, new_expense):
    for index, expense in enumerate(expenses):
        if expense.expense_id == expense_id:
            expenses[index] = new_expense
            break

def delete_expense(expense_id):
    for index, expense in enumerate(expenses):
        if expense.expense_id == expense_id:
            del expenses[index]
            break

def display_expenses():
    for expense in expenses:
        print(expense)

users = {"admin": "password"}

def authenticate_user(username, password):
    if username in users and users[username] == password:
        print("Authentication successful")
        return True
    else:
        print("Authentication failed")
        return False

def categorize_expenses():
    categories = {"food": 0, "transportation": 0, "other": 0}
    for expense in expenses:
        if expense.category == "food":
            categories["food"] += expense.amount
        elif expense.category == "transportation":
            categories["transportation"] += expense.amount
        else:
            categories["other"] += expense.amount
    return categories

def summarize_expenses():
    total = 0
    for expense in expenses:
        total += expense.amount
    return total

def calculate_total_expenses():
    return sum(expense.amount for expense in expenses)

def generate_summary_report():
    categories = categorize_expenses()
    print("Summary Report:")
    print(f"Total expenses for food: {categories['food']}")
    print(f"Total expenses for transportation: {categories['transportation']}")
    print(f"Total expenses for other: {categories['other']}")
    print(f"Total expenses: {calculate_total_expenses()}")

def cli():
    authenticated = authenticate_user("admin", "password")
    if authenticated:
        while True:
            print("\n1. Add a new expense")
            print("2. Update an existing expense")
            print("3. Delete an expense")
            print("4. Display all expenses")
            print("5. Generate a summary report")
            print("6. Exit the application")

            option = int(input("Select an option: "))

            if option == 1:
                expense_id = len(expenses) + 1
                date = input("Enter the date: ")
                category = input("Enter the category: ")
                description = input("Enter the description: ")
                amount = float(input("Enter the amount: "))
                new_expense = Expense(expense_id, date, category, description, amount)
                add_expense(new_expense)

            elif option == 2:
                expense_id = int(input("Enter the expense ID to update: "))
                new_date = input("Enter the new date: ")
                new_category = input("Enter the new category: ")
                new_description = input("Enter the new description: ")
                new_amount = float(input("Enter the new amount: "))
                new_expense = Expense(expense_id, new_date, new_category, new_description, new_amount)
                update_expense(expense_id, new_expense)

            elif option == 3:
                expense_id = int(input("Enter the expense ID to delete: "))
                delete_expense(expense_id)

            elif option == 4:
                display_expenses()

            elif option == 5:
                generate_summary_report()

            elif option == 6:
                print("Exiting the application")
                break

            else:
                print("Invalid option. Please select a valid option.")

cli()