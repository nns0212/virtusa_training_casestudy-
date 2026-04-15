import utils
import pandas as pd
import matplotlib.pyplot as plt

def monthly_summary():
    data = utils.load_expenses()
    df = pd.DataFrame(data)

    if df.empty:
        print("No data available")
        return

    df['date'] = pd.to_datetime(df['date'])
    df['month'] = df['date'].dt.to_period('M')

    summary = df.groupby('month')['amount'].sum()
    print("\n Monthly Summary:")
    print(summary)

def category_analysis():
    data = utils.load_expenses()
    df = pd.DataFrame(data)

    if df.empty:
        print("No data available")
        return

    category_sum = df.groupby('category')['amount'].sum()

    print("\n📊 Category-wise Spending:")
    print(category_sum)

    # Highest spending category
    highest = category_sum.idxmax()
    print(f"Most significant category of spending: {highest}")

    # Pie chart
    category_sum.plot.pie(autopct='%1.1f%%')
    plt.title("Category-wise Expense Distribution")
    plt.ylabel("")
    plt.show()