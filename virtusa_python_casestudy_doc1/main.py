import utils
from datetime import datetime
from analysis import monthly_summary, category_analysis

def add_expense():
    date = input("Enter date (YYYY-MM-DD): ")
    category = input("Enter category (Food/Travel/Bills/etc): ")
    amount = float(input("Enter amount: "))
    description = input("Enter description: ")

    expense = {
        "date": date,
        "category": category,
        "amount": amount,
        "description": description
    }

    data = utils.load_expenses()
    data.append(expense)
    utils.save_expenses(data)

    print("✅ Expense added successfully!")

def view_expenses():
    data = utils.load_expenses()
    for exp in data:
        print(exp)

def menu():
    while True:
        print("\n--- Expense Tracker ---")
        print("1. Add Expense")
        print("2. View Expenses")
        print("3. Monthly Summary")
        print("4. Category Analysis")
        print("5. Exit")

        choice = input("Choose: ")

        if choice == "1":
            add_expense()
        elif choice == "2":
            view_expenses()
        elif choice == "3":
            monthly_summary()
        elif choice == "4":
            category_analysis()
        elif choice == "5":
            break
        else:
            print("Invalid choice")

if __name__ == "__main__":
    menu()