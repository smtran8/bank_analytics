import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

bank_data = pd.read_csv("python/bank.csv", sep = ";")
#print(bank_data.shape)
bank_data.columns = bank_data.columns.str.strip().str.lower()
#print(bank_data.columns)

unknown_columns = (bank_data == "unknown").sum()
print(unknown_columns)