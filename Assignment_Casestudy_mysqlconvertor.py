import pandas as pd
import mysql.connector

# Load the dataset
df = pd.read_csv('sample_ecommerce_data.csv')

# Handle missing values (example: fill with zeros or drop rows)
df.fillna(0, inplace=True)

# Correct data types
df['Transaction Date'] = pd.to_datetime(df['Transaction Date'])

# Normalize product categories and subcategories (example)
df['Product Category'] = df['Product Category'].str.strip().str.lower()
df['Product Subcategory'] = df['Product Subcategory'].str.strip().str.lower()

# Feature engineering: Total Sales and Transaction Month
df['Total Sales'] = df['Product Price'] * df['Quantity Sold']
df['Transaction Month'] = df['Transaction Date'].dt.month

# Display the first few rows of the dataframe
print(df.head())

# Create a connection to the MySQL database
username = 'root'
password = 'pass@word1'
host = 'localhost'

cnx = mysql.connector.connect(
    user=username,
    password=password,
    host=host
)

# Create a cursor object
cursor = cnx.cursor()

# Create a database
cursor.execute("CREATE DATABASE ecommerce_dbs")

# Create a connection to the newly created database
cnx.database = 'ecommerce_dbs'

# Create a table in the MySQL database
cursor.execute("""
    CREATE TABLE ecommerce_data (
        TransactionID INT,
        ProductID INT,
        ProductCategory VARCHAR(255),
        ProductSubcategory VARCHAR(255),
        ProductPrice DECIMAL(10, 2),
        QuantitySold INT,
        TransactionDate DATE,
        CustomerID INT,
        CustomerLocation VARCHAR(255),
        PaymentMethod VARCHAR(255)
    )
""")

# Insert the dataframe into the MySQL table
insert_query = """
    INSERT INTO ecommerce_data (
        TransactionID,
        ProductID,
        ProductCategory,
        ProductSubcategory,
        ProductPrice,
        QuantitySold,
        TransactionDate,
        CustomerID,
        CustomerLocation,
        PaymentMethod
    ) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
"""

data = []
for index, row in df.iterrows():
    data.append((
        row['Transaction ID'],
        row['Product ID'],
        row['Product Category'],
        row['Product Subcategory'],
        row['Product Price'],
        row['Quantity Sold'],
        row['Transaction Date'],
        row['Customer ID'],
        row['Customer Location'],
        row['Payment Method']
    ))

cursor.executemany(insert_query, data)

# Commit the changes
cnx.commit()

# Close the cursor and connection
cursor.close()
cnx.close()