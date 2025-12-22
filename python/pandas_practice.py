import pandas as pd
import numpy as np

#Task 1: Load the data and inspect
df = pd.read_csv("python/bank-additional-full.csv", sep = ";")
rows_before = len(df)
missing_before = df.isna().sum()

#print(df.head())
#Looks like that there are 41188 rows and 21 columns in this dataset
#There are some unknown values
#print(df.shape)

#Task 2: Standardize column names
#Strip down the white spaces, lower column names and repalce '.' with '_' for better human readable purpose
df.columns = df.columns.str.strip().str.lower().str.replace(".", "_")

#print(df.head())

#Task 3: Find the unknown values
#print((df == "unknown").sum())
#Look like we have some unknown fields, especially 8597 for defaults and 1731 for education. For education, this is definitely misrecorded, considering the 
#least education level could be put as basic

df = df.replace("unknown", np.nan)
#print(df.head())
df["pdays"] = df["pdays"].replace(999, np.nan) #pdays => days since the client was last contacted, if it is 999 => consider never contacted
#print(df["pdays"].value_counts().head())

#Task 4: Check critical columns.
#print(df[df["age"] <= 0]) #Empty, good
#print(df[df["campaign"] < 1]) #Empty, good

#Task 5: Deeper cleaning, data cleaning

critical_cols = ["job","marital","education","default","housing","loan","contact","poutcome","month","day_of_week","y"]
for col in critical_cols:
    df[col] = df[col].str.strip().str.lower()
    print(f"Value counts for {col}:")
    print(df[col].value_counts())

#Task 6: Identify duplicates
#print(df.duplicated().sum())
#print(df.duplicated(subset=["age", "job", "campaign", "month", "day_of_week"]).sum()) #Not to drop anything blindly, because age and job can definitely be the same between 2 different people

rows_after = len(df)
missing_after = df.isna().sum()

print("\nSummary")
print(f"Rows: {rows_before} -> {rows_after} (change: {rows_after-rows_before})")
print("\nTop missing values AFTER cleaning:")
print(missing_after.sort_values(ascending=False).head(10))
print(f"Difference in missing: {missing_after - missing_before}")

df.to_csv("python/bank-additional-clean.csv")