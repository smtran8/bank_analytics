# Overview
This is an end-to-end Data Analysis Project I did in Winter 2025. This project analyzes banking transaction data using **MySQL** to uncover transaction trends, customer behavior, and potential fraud signals. The analysis is designed to be a suitable for report and extensible to Python.

# Dataset
- A Kaggle Dataset for practice with SQL: **Bank Transaction Dataset for Fraud Detection**. Source: https://www.kaggle.com/datasets/valakhorasani/bank-transaction-dataset-for-fraud-detection
- Includes ~2500 banking transactions, including transaction details (such as AccountID, TransactionID, TransactionAmount,...), Customer Behavior (TransactionType (Credit, Debit), TransactionChannel(ATM, Online)), Device Usage (DeviceID, IPAddress) and Login Activity (Login Attempts)
- The dataset is synthetic and honest, designed specifically for analytics and fraud detection practice

# Techstack
1. First Deliverable: **SQL**
- MySQL version 8.0 as the main analytics tool
- Docker (to create local MySQL environment)
- DBeaver (for navigate database)
- GitHub (for documentation)

2. Second Deliverable: **Python**
- First cleaning practice: practice on the dataset bank-additional-full.csv (Kaggle) using Python with pandas and numpy library
- Tasks included:
  + Initial Inspection (Load the file, check for row counts and missing value counts)
  + Column name Standardization (Strip white spaces, lower character, replace "." with "_". For example 'day.of.week' will become 'day_of_week')
  + Handling Encoded Values => Change 'unknown' to NaN
  + Normalizes data: Navigate critical columns (job, age, contact,...) and strip down white spaces and lowercase values
  + Validation Check: Check to see numeric columns follow logical constraints, such as age > 0
  + Summary: Compare dataset after cleaning, focus on missing values
- Second Project: Perform cleaning, EDA analysis and Business Metrics Extraction:
  1. Cleaning: Same as the first cleaning practice
  2. EDA Analysis: Apply Seaborn library with different plots for Exploratory Data Analysis, specifically:
     - Find conversion rate difference by age groups => Bar Plot
     - Find conversion rate difference by contact frequency => Line Plot
     - Find conversion rate difference by job => Bar Plot
     - Find conversion rate difference by call duration => Scatter Plot
  3. Business Metrics Extraction:
     - Identify our KPI, in this case conversion rate (The proportion of customers who subscribed to a term deposit after the calls)
     - Extract this KPI: conversion rate by different categories: age, job, education
     
**Based on our metrics**:

**Age Group**: The 0-25 age group has the highest conversion rate, with 55+ seconding, suggesting that marketing efforts could be more focused on these 2 demographics.

**Job**: Certain professions, such as students and retired individuals, show higher conversion rates. Tailoring campaigns to these groups could be beneficial. This correlates to our age groups as well.

**Education**: Individuals with higher education levels tend to have better conversion rates. Marketing strategies could be adjusted to target these educational segments more effectively.

**Overall: Best performance is in: 0-25 age group, students, education level tertiary**
