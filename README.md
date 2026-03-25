# 🎬 NETFLIX-Data-SQL-Analysis

<p align="center">
  <img src="https://upload.wikimedia.org/wikipedia/commons/0/08/Netflix_2015_logo.svg" alt="Netflix Logo" height="120">
</p>

A complete SQL-based data analysis project on **Netflix content dataset** using **PostgreSQL**.  
This project demonstrates how to **query, analyze, and generate insights** from Netflix’s catalog to uncover trends related to **movies, TV shows, ratings, genres, countries, and actors** using 15 structured SQL queries.  

---

## 📑 Table of Contents

- <a href="#project-overview">📌 Project Overview</a>  
- <a href="#dataset-used">📂 Dataset Used</a>  
- <a href="#project-objectives">🎯 Project Objectives</a>  
- <a href="#business-problems">⭕ Business Problems Addressed</a>  
- <a href="#methodology">🛠️ Methodology</a>  
- <a href="#insights">🔍 Key Insights & Solutions</a>  
- <a href="#queries">📈 Sample SQL Queries Used</a>  
- <a href="#skills">🧠 Skills Gained</a>  
- <a href="#importance">🔑 Why This Project Matters</a>  
- <a href="#conclusion">✅ Conclusion</a>  
- <a href="#contact">📬 Connect with Me</a>  
- <a href="#project-visual">📸 Project Snapshot</a>  

---

## <span id="project-overview">📌 Project Overview</span>


This project focuses on analyzing a fictional dataset of **Netflix content records**.  
The goal was to answer **real-world entertainment business questions** such as:  

- What is the ratio of Movies vs TV Shows?  
- Which genres, ratings, and countries dominate Netflix content?  
- Who are the top actors and directors?  
- What are the viewing trends in India?  
- How much violent or sensitive content exists?  

By running SQL queries, I extracted valuable **content distribution insights** which can be useful for **streaming platforms, media analysts, and business strategists**.  

---

## <span id="dataset-used">📂 Dataset Used</span> 

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

## <span id="project-objectives">🎯 Project Objectives</span> 

The main objectives of this Netflix data analysis project were to:  

📊 Compare Movies vs TV Shows count  
🌍 Analyze country-wise content distribution  
📈 Track yearly release trends (e.g., in India)  
🎭 Identify top actors, directors, and genres  
⭐ Study ratings and audience segmentation  
🔎 Detect violent/sensitive content patterns  

---

## <span id="business-problems">⭕ Business Problems Addressed</span>

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

## <span id="methodology">🛠️ Methodology</span>  

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

## <span id="insights">🔍 Key Insights & Solutions</span>  

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

## <span id="queries">📈 Sample SQL Queries Used</span>  

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

## <span id="skills">🧠 Skills Gained</span>

From this project, I developed skills in:  

- SQL data wrangling with **PostgreSQL**  
- Text-based queries with `ILIKE`, `UNNEST`, `SPLIT_PART`  
- Aggregating, filtering, and ranking datasets  
- Designing queries to answer **business-focused questions**  
- Entertainment analytics & trend identification  

---

## <span id="importance">🔑 Why This Project Matters</span>  

✅ Simulates **real-world streaming analytics**  
📁 Perfect for GitHub/LinkedIn portfolio  
🎤 Great interview talking point for **data analyst roles**  
📊 Prepares ground for **Power BI/Tableau dashboards**  
🚀 Demonstrates SQL expertise on unstructured datasets  

---

## <span id="conclusion">✅ Conclusion</span>  

This SQL project provided deep insights into Netflix’s content library.  
By analyzing a single dataset with PostgreSQL, I explored patterns in **movies vs TV shows, ratings, genres, countries, and actors**.  

It showcased how **structured SQL queries** can convert raw entertainment data into **business intelligence** useful for media companies and strategists.  

---

## <span id="contact">📬 Connect with Me</span>  

 <!-- Typing Animation / 🤝 Connect with me -->
[![Typing SVG](https://readme-typing-svg.herokuapp.com?color=0DAD8D&lines=Let’s+connect+and+collaborate+on+meaningful+projects!;Click+the+buttons+below+to+connect+with+me+directly!)](https://git.io/typing-svg)

<div align="center">
<!-- 💼 LinkedIn -->
<a href="https://www.linkedin.com/in/rajeevtiwari8055"><img src="https://cdn-icons-png.flaticon.com/512/174/174857.png" alt="LinkedIn" width="30" height="30"/></a>
<!-- 📮 Gmail -->
<a href="mailto:rajeevtiwari8055@gmail.com" target="_blank"><img src="https://cdn-icons-png.flaticon.com/512/732/732200.png" alt="Email" width="35" height="35"></a>
<!-- ✖️ X -->
<a href="https://x.com/rajeevtiwariRT" target="_blank"><img src="https://cdn-icons-png.flaticon.com/512/5969/5969020.png" alt="X" width="35" height="35"></a>  
<!-- 🆔 GitHub -->
<a href="https://github.com/rajeevtiwari8055" target="_blank"><img src="https://cdn-icons-png.flaticon.com/512/733/733553.png" alt="GitHub" width="35" height="35"></a>
<!-- 🌐 Website -->
<a href="https://rajeevtiwari8055.github.io/" target="_blank"><img src="https://cdn-icons-png.flaticon.com/512/841/841364.png" alt="Website" width="35" height="35"></a>
</div>

<!-- Typing Animation / 🤝 Thanks for Visiting! -->
[![Typing SVG](https://readme-typing-svg.herokuapp.com?color=8A2BE2&lines=🤝Thank+you+for+visiting+my+profile!)](https://git.io/typing-svg)

<!-- ⭐💫 Shower stars if you like my repos -->
<div align="center">
<img src="https://media.giphy.com/media/ObNTw8Uzwy6KQ/giphy.gif" width="30">
<a href="https://github.com/rajeevtiwari8055/rajeevtiwari8055" alt="GitHub Stars" title="Star my repositories">
<img src="https://img.shields.io/badge/Shower_stars_if_you_like_my_repositories-15k?style=for-the-badge&color=f9c513&logo=github&logoColor=black"/>
</a>
</div>

---

## <span id="project-visual">📸 Project Snapshot</span>

🎬 **NETFLIX Data SQL Analysis**  
(*Visual: Netflix dataset, SQL queries, charts on country/genre/rating trends*)  

![NETFLIX Data SQL Analysis](Netflix%20Data.jpg)
![NETFLIX Data SQL Analysis](Netflix%20Data2.jpg)    

---

