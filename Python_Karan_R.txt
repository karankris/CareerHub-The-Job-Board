#Input / Output
# 1. Accept Empid,EmpName,Monthly_Salary,Tot_Deductions, Tot_Allowances and Display Employee Name and Salary in hand

# Accept Employee details
emp_id = input("Enter Employee ID: ")
emp_name = input("Enter Employee Name: ")
monthly_salary = float(input("Enter Monthly Salary: "))
tot_deductions = float(input("Enter Total Deductions: "))
tot_allowances = float(input("Enter Total Allowances: "))

# Calculate salary in hand
salary_in_hand = monthly_salary - tot_deductions + tot_allowances

# Display the result
print(f"Employee Name: {emp_name}")  
print(f"Salary in Hand: {salary_in_hand}")

# if Conditions :
# Accept 3 integers from the user
num1 = int(input("Enter first integer: "))
num2 = int(input("Enter second integer: "))
num3 = int(input("Enter third integer: "))

# 1) Find the minimum value using if-else
if num1 <= num2 and num1 <= num3:
    minimum = num1
elif num2 <= num1 and num2 <= num3:
    minimum = num2
else:
    minimum = num3

# 2)  Find the maximum value using if-else
if num1 >= num2 and num1 >= num3:
    maximum = num1
elif num2 >= num1 and num2 >= num3:
    maximum = num2
else:
    maximum = num3

# Display the minimum and maximum values
print(f"The minimum value is: {minimum}")
print(f"The maximum value is: {maximum}")


# loops
# 1. Accept Integers from User till Users Choice and do the Following:
numbers = []
choice = 'y'

while choice.lower() == 'y':
    num = int(input("Enter an integer: "))
    numbers.append(num)
    choice = input("Do you want to enter another number? (y/n): ")

# Calculate sum, average, max, and min
sum_of_numbers = sum(numbers)
average_of_numbers = sum_of_numbers / len(numbers)
max_number = max(numbers)
min_number = min(numbers)

# Display results
print(f"Sum of all numbers: {sum_of_numbers}")
print(f"Average of numbers: {average_of_numbers}")
print(f"Maximum number: {max_number}")
print(f"Minimum number: {min_number}")

# 2. Accept a String from User an do the following :

# Accept string from user
user_string = input("Enter a string: ")

# Find the length
length_of_string = len(user_string)

# Display string in reverse
reversed_string = user_string[::-1]

# Display every alternate character in upper case idx is index of the string
alternate_upper = ''.join([char.upper() if idx % 2 == 0 else char for idx, char in enumerate(user_string)])

# Count the number of vowels
vowels = "aeiouAEIOU"
vowel_count = sum(1 for char in user_string if char in vowels)

# Display results
print(f"Length of the string: {length_of_string}")
print(f"Reversed string: {reversed_string}")
print(f"Alternate characters in upper case: {alternate_upper}")
print(f"Number of vowels in the string: {vowel_count}")

# Accept username and date of birth
username = input("Enter username: ")
dob = input("Enter Date of Birth (dd-mon-yy): ")

# 4 Create the password
password = username[:4] + dob[-2:] + "$"  # string slicing

# Display the password
print(f"Generated password: {password}")

# 5) Encrypt the password
# Accept a string (password)
password = input("Enter the password to encrypt: ")

# Initialize an empty string to store the encrypted password
encrypted_password = ""

# Perform encryption (shift by 3)
for char in password:
    encrypted_char = chr(ord(char) + 3)
    encrypted_password += encrypted_char

# Display the encrypted password
print("Encrypted password:", encrypted_password)

# 3. Write Python Program to do the following :
# 1. Display Area of
# Circle
# Parallelogram

import math

# Area of Circle
radius = float(input("Enter radius of circle: "))
circle_area = math.pi * radius ** 2
print(f"Area of the circle: {circle_area}")

# Area of Parallelogram
base = float(input("Enter base of parallelogram: "))
height = float(input("Enter height of parallelogram: "))
parallelogram_area = base * height
print(f"Area of the parallelogram: {parallelogram_area}")


# 4. Accept Integer and find Square root of Integer

# Accept an integer
num = int(input("Enter an integer: "))

# Calculate square root manually (using approximation method)
approx_sqrt = num ** 0.5

# Display the square root
print(f"Square root of {num} is approximately: {approx_sqrt}")


# B) Session 3 / 4

# List / Tuples / Dictionary / Sets

# 1. Create a List for the following :
# a. Accept Fruits Name and their price(per kg)
# b. Fruits Name should be at odd index


# Create an empty list to hold fruits and their prices
fruits_prices = []

# Accept 5 fruits and their prices
for i in range(5):
    fruit_name = input(f"Enter fruit name {i + 1}: ")
    fruit_price = float(input(f"Enter price per kg for {fruit_name}: "))
    fruits_prices.append(fruit_name)  # Add fruit name at odd index
    fruits_prices.append(fruit_price)   # Add price at even index

# Display the list of fruits and their prices
print("Fruits and their prices (per kg):")
for i in range(len(fruits_prices)):
    print(f"Index {i}: {fruits_prices[i]}")


# 2. Customer will buy fruits from you (Show him the Fruits Menu)
# Write a Program to
# a. Calculate Total Price of Fruits Bought .
# (Assume price for 1 kg )
# b. Add New Fruits in the List
# c. Show Total Fruits in the List



# Show the fruits menu
print("\nFruits Menu:")
for i in range(0, len(fruits_prices), 2):
    print(f"{fruits_prices[i]} - ${fruits_prices[i + 1]} per kg")

# Initialize total price
total_price = 0
continue_buying = 'y'

while continue_buying.lower() == 'y':
    bought_fruit = input("Enter the fruit you want to buy: ")
    quantity = float(input(f"Enter the quantity (in kg) of {bought_fruit}: "))
    
    # Find the price of the bought fruit
    for i in range(0, len(fruits_prices), 2):
        if fruits_prices[i].lower() == bought_fruit.lower():
            total_price += fruits_prices[i + 1] * quantity
            break
    else:
        print("Fruit not found in the menu.")
    
    continue_buying = input("Do you want to buy another fruit? (y/n): ")

# Display total price of fruits bought
print(f"\nTotal Price of Fruits Bought: ${total_price:.2f}")

# Add new fruits to the list
add_fruit = input("Do you want to add a new fruit? (y/n): ")
if add_fruit.lower() == 'y':
    new_fruit = input("Enter the new fruit name: ")
    new_price = float(input("Enter the price per kg for the new fruit: "))
    fruits_prices.append(new_fruit)
    fruits_prices.append(new_price)

# Show total fruits in the list
print(f"\nTotal Fruits in the List: {len(fruits_prices) // 2}")


# 3. Create Foll. Information in the Tuple (atleast 5 Employees)
# 1. EmpId - Phone Numbers (One Employee can have Multiple Numbers )
# 2. Accept Empid from User.
# Display his Numbers only if he exists in the Database(Tuple)
# Display App. Message if not present
# 3. Update Employee phone Number
# Accept Empid from User
# Check whether he / she Exists
# Accept New Phone Number
# Update
# Display Appropriate Message for any task

# Create a tuple of employee information (EmpId, Phone Numbers)
employees = (
    ("E001", ["1234567890", "2345678901"]),
    ("E002", ["3456789012"]),
    ("E003", ["4567890123", "5678901234"]),
    ("E004", ["6789012345"]),
    ("E005", ["7890123456", "8901234567"]),
)

# Accept EmpId from user and display their phone numbers
emp_id = input("\nEnter Employee ID to view phone numbers: ")
found = False
for emp in employees:
    if emp[0] == emp_id:
        print(f"Phone Numbers for {emp_id}: {', '.join(emp[1])}")
        found = True
        break

if not found:
    print("Employee ID not found in the database.")

# Update Employee phone number
update_id = input("\nEnter Employee ID to update phone number: ")
found = False
for emp in employees:
    if emp[0] == update_id:
        new_phone = input("Enter the new phone number: ")
        emp[1].append(new_phone)  # Update phone numbers
        print(f"Updated phone numbers for {update_id}: {', '.join(emp[1])}")
        found = True
        break

if not found:
    print("Employee ID not found for update.")



# 4. Store the Following info in Dictionary
# Department Name and their Employee Names
# Note : One Department can have multiple Employees

# Perform the Following Operations :
# 1. Add a New Department Name and Employees in that Department
# If a New Department Name doesnot Exists
# 2. Accept Dept Name from User and List all Employees
# If Dept Name Exists in the Database
# 3. Add a New Employee in Existing Department
# 4. Delete Existing Employee From Department


# Initialize a dictionary to hold department names and employee names
departments = {}

# Add a new department and employees
new_department = input("\nEnter new department name: ")
if new_department not in departments:
    num_employees = int(input(f"How many employees in {new_department}? "))
    employees_list = []
    for _ in range(num_employees):
        employee_name = input("Enter employee name: ")
        employees_list.append(employee_name)
    departments[new_department] = employees_list
    print(f"Added new department '{new_department}' with employees: {employees_list}")
else:
    print("Department already exists.")

# List all employees in a specific department
dept_name = input("\nEnter department name to list employees: ")
if dept_name in departments:
    print(f"Employees in {dept_name}: {', '.join(departments[dept_name])}")
else:
    print("Department not found.")

# Add a new employee in an existing department
existing_dept = input("\nEnter existing department to add an employee: ")
if existing_dept in departments:
    new_employee = input("Enter new employee name: ")
    departments[existing_dept].append(new_employee)
    print(f"Added {new_employee} to {existing_dept}.")
else:
    print("Department not found.")

# Delete an existing employee from a department
dept_to_modify = input("\nEnter department name to delete an employee from: ")
if dept_to_modify in departments:
    emp_to_remove = input("Enter employee name to remove: ")
    if emp_to_remove in departments[dept_to_modify]:
        departments[dept_to_modify].remove(emp_to_remove)
        print(f"Removed {emp_to_remove} from {dept_to_modify}.")
    else:
        print("Employee not found in the department.")
else:
    print("Department not found.")


# 5. Create Following two Sets
# 1. Fruit_Salesman1
# 2. Fruit_Salesman2
# Create Fruits for both Salesmans
# Perform the Following Operations
# 1. Find out Common Fruits with both Salesman
# 2. List Extra Fruits with Both Salesman
# 3. List Total Fruits with both Salesman


# Create sets for two fruit salesmen
fruit_salesman1 = {"Apple", "Banana", "Orange", "Grapes"}
fruit_salesman2 = {"Banana", "Kiwi", "Mango", "Grapes"}

# Find common fruits with both salesmen
common_fruits = fruit_salesman1.intersection(fruit_salesman2)
print(f"\nCommon fruits with both salesmen: {common_fruits}")

# List extra fruits with both salesmen
extra_fruits_salesman1 = fruit_salesman1.difference(fruit_salesman2)
extra_fruits_salesman2 = fruit_salesman2.difference(fruit_salesman1)
print(f"Extra fruits with Salesman 1: {extra_fruits_salesman1}")
print(f"Extra fruits with Salesman 2: {extra_fruits_salesman2}")

# List total fruits with both salesmen
total_fruits = fruit_salesman1.union(fruit_salesman2)
print(f"Total fruits with both salesmen: {total_fruits}")
