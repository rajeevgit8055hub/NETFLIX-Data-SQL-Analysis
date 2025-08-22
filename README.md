# 🎬 NETFLIX-Data-SQL-Analysis

A complete SQL-based data analysis project on **Netflix content dataset** using **PostgreSQL**.  
This project demonstrates how to **query, analyze, and generate insights** from Netflix’s catalog to uncover trends related to **movies, TV shows, ratings, genres, countries, and actors** using 15 structured SQL queries.  

---

## 📌 Project Overview  

This project focuses on analyzing a fictional dataset of **Netflix content records**.  
The goal was to answer **real-world entertainment business questions** such as:  

- What is the ratio of Movies vs TV Shows?  
- Which genres, ratings, and countries dominate Netflix content?  
- Who are the top actors and directors?  
- What are the viewing trends in India?  
- How much violent or sensitive content exists?  

By running SQL queries, I extracted valuable **content distribution insights** which can be useful for **streaming platforms, media analysts, and business strategists**.  

---

## 📂 Dataset Used  

The dataset was stored in a single table `netflix` created in **PostgreSQL**.  
The schema included the following fields:  

- `show_id` – Unique ID of the content  
- `type` – Type of content (Movie / TV Show)  
- `title` – Title of the show/movie  
- `director` – Director of the content  
- `casts` – Cast members (actors/actresses)  
- `country` – Country of production  
- `date_added` – Date the content was added to Netflix  
- `release_year` – Year the content was released  
- `rating` – Content rating (e.g., TV-MA, PG-13)  
- `duration` – Duration (e.g., 90 min for movies, 2 Seasons for TV shows)  
- `listed_in` – Genres/categories  
- `description` – Short summary of the content  

📎 Source file: Single **Excel dataset** → imported into PostgreSQL.  

---

## 🎯 Project Objectives  

The main objectives of this Netflix data analysis project were to:  

📊 Compare Movies vs TV Shows count  
🌍 Analyze country-wise content distribution  
📈 Track yearly release trends (e.g., in India)  
🎭 Identify top actors, directors, and genres  
⭐ Study ratings and audience segmentation  
🔎 Detect violent/sensitive content patterns  

---

## ⭕ Business Problems Addressed  

The entertainment analytics team wanted answers to these questions:  

- How many **Movies vs TV Shows** exist?  
- What’s the **most common rating** overall and per type?  
- Which **year** had the highest content releases?  
- What are the **top 5 countries** producing Netflix content?  
- Which are the **longest movies** in the catalog?  
- How much content was **added in the last 5 years**?  
- Which **directors** have the most shows?  
- How many TV shows have **more than 5 seasons**?  
- Which **genres dominate** Netflix?  
- How much content came from **India**, and in which years?  
- Which actors like **Salman Khan** appeared the most?  
- Who are the **top 10 actors** from India’s Netflix movies?  
- How much of the catalog contains **violence or “kill” keywords**?  

---

## 🛠️ Methodology  

A structured SQL workflow was followed:  

### 📥 Data Preparation  
- Imported dataset from Excel into PostgreSQL.  
- Used appropriate data types (`INT`, `VARCHAR`, `DATE`).  
- Cleaned strings with `TRIM`, `SPLIT_PART`, and `STRING_TO_ARRAY`.  

### 🔎 Basic SQL Exploration  
- Queries with `SELECT`, `DISTINCT`, `WHERE`.  
- Basic filters for **year**, **country**, **director**.  

### ⚙️ Advanced SQL Analysis  
- Aggregations: `COUNT`, `ROUND`, `GROUP BY`, `ORDER BY`.  
- Date filtering using `TO_DATE` and `INTERVAL`.  
- Text search with `ILIKE` for case-insensitive matching.  
- Array operations (`UNNEST`) for splitting multiple genres/actors.  

---

## 🔍 Key Insights & Solutions  

✅ **Movies vs TV Shows Count:**  
`SELECT type, COUNT(*) FROM netflix GROUP BY type;`  
→ Movies dominate the dataset compared to TV Shows.  

✅ **Most Common Rating:**  
`SELECT rating, COUNT(*) ORDER BY COUNT DESC LIMIT 1;`  
→ Identified the most popular parental rating.  

✅ **Top 5 Countries:**  
Used `unnest(string_to_array(country, ','))`  
→ USA and India lead in content production.  

✅ **Longest Movie:**  
`ORDER BY SPLIT_PART(duration, ' ', 1)::INT DESC`  
→ Revealed the movie with maximum runtime.  

✅ **Content in Last 5 Years:**  
`WHERE TO_DATE(date_added, 'Month DD, YYYY') >= CURRENT_DATE - INTERVAL '5 years'`  
→ Helped track recent additions.  

✅ **Top Actors from India:**  
`UNNEST(STRING_TO_ARRAY(casts, ',')) GROUP BY actor ORDER BY COUNT DESC`  
→ Listed most frequent Indian actors.  

✅ **Violence Categorization:**  
`CASE WHEN description ILIKE '%kill%' OR description ILIKE '%violence%' THEN 'Bad' ELSE 'Good' END`  
→ Segmented content into **Good vs Bad** buckets.  

---

## 📈 Sample SQL Queries Used  

### 🟢 Basic Queries  
- Count Movies vs TV Shows  
- List all content from 2020  
- Find all TV Shows with more than 5 seasons  
- Movies with missing director field  

### 🔵 Advanced Queries  
- Top 5 content-producing countries  
- Average yearly releases from India  
- Actor frequency analysis (Salman Khan + Top 10 Indian actors)  
- Genre-wise content breakdown  
- Sensitive content categorization  

💡 *15+ SQL queries crafted to reflect real Netflix business use cases.*  

---

## 🧠 Skills Gained  

From this project, I developed skills in:  

- SQL data wrangling with **PostgreSQL**  
- Text-based queries with `ILIKE`, `UNNEST`, `SPLIT_PART`  
- Aggregating, filtering, and ranking datasets  
- Designing queries to answer **business-focused questions**  
- Entertainment analytics & trend identification  

---

## 🔑 Why This Project Matters  

✅ Simulates **real-world streaming analytics**  
📁 Perfect for GitHub/LinkedIn portfolio  
🎤 Great interview talking point for **data analyst roles**  
📊 Prepares ground for **Power BI/Tableau dashboards**  
🚀 Demonstrates SQL expertise on unstructured datasets  

---

## ✅ Conclusion  

This SQL project provided deep insights into Netflix’s content library.  
By analyzing a single dataset with PostgreSQL, I explored patterns in **movies vs TV shows, ratings, genres, countries, and actors**.  

It showcased how **structured SQL queries** can convert raw entertainment data into **business intelligence** useful for media companies and strategists.  

---

## 📸 Project Overview

🎬 **NETFLIX Data SQL Analysis**  
(*Visual: Netflix dataset, SQL queries, charts on country/genre/rating trends*)  

![NETFLIX Data SQL Analysis](Netflix%20Data.png)  

---

