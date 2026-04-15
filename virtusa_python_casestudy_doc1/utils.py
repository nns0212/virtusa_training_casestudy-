import json
import os

FILE = "data.json"

def load_expenses():
    if not os.path.exists(FILE):
        return []
    with open(FILE, "r") as f:
        return json.load(f)

def save_expenses(data):
    with open(FILE, "w") as f:
        json.dump(data, f, indent=4)