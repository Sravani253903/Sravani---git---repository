import pandas as pd

# Load the dataset
df = pd.read_csv('sample_ecommerce_data.csv')
# Display the first few rows of the dataframe
print(df.head())

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