# 📊 Sales Analysis and Database Integration  

![Python](https://img.shields.io/badge/Python-3.9%2B-blue?logo=python&logoColor=white)  
![Pandas](https://img.shields.io/badge/Pandas-Data%20Analysis-green?logo=pandas)  
![MySQL](https://img.shields.io/badge/MySQL-Database-orange?logo=mysql&logoColor=white)  
![SQLAlchemy](https://img.shields.io/badge/SQLAlchemy-ORM-red?logo=python)  
![Status](https://img.shields.io/badge/Project-Active-brightgreen)  

This project performs **Sales Data Analysis** using Python and integrates the cleaned data into a **MySQL database**.  
It includes data cleaning, transformation, feature engineering, and database integration.  

---

## 🚀 Features  

- **Data Import**  
  - Reads dataset from `archive.zip`.  
  - Handles missing values (`Not Available`, `unknown`).  

- **Data Cleaning**  
  - Converts column names to lowercase with underscores.  
  - Drops unnecessary columns.  
  - Converts `order_date` column to datetime.  

- **Feature Engineering**  
  - Creates new calculated columns:  
    - `discount` (from list price & discount percent)  
    - `sale_price` (after discount)  
    - `profit` (sale price – cost price)  

- **Database Integration**  
  - Connects to MySQL using **SQLAlchemy + PyMySQL**.  
  - Loads processed data into `dataset_orders` table.  

---

## 🛠️ Tech Stack  

- **Python Libraries**  
  - `pandas` – Data manipulation  
  - `sqlalchemy` – Database ORM  
  - `pymysql` – MySQL connector  

- **Database**  
  - MySQL  

---

## 📂 Project Structure  

```bash
├── sales_analysis.py       # Python script for data cleaning & DB integration
├── sales_analysis.sql      # SQL script (if applicable for DB setup/queries)
├── archive.zip             # Dataset file (CSV inside zip)
├── README.md               # Documentation
````

---

## ⚡ How to Run

1. Clone the repository:

   ```bash
   git clone https://github.com/your-username/sales-analysis.git
   cd sales-analysis
   ```

2. Install dependencies:

   ```bash
   pip install pandas sqlalchemy pymysql
   ```

3. Update MySQL credentials in the script:

   ```python
   engine = sal.create_engine('mysql+pymysql://username:password@localhost:3306/db')
   ```

4. Run the script:

   ```bash
   python sales_analysis.py
   ```

---

## 📊 Sample Output

* Cleaned dataset with new columns (`discount`, `sale_price`, `profit`).
* Data successfully loaded into MySQL table **dataset_orders**.

---

## 🔮 Future Enhancements

* Add visualization scripts (Matplotlib/Seaborn).
* Build interactive dashboards (Power BI/Tableau).
* Automate ETL pipeline with Airflow/Luigi.

---

## 👩‍💻 Author

**Fiza Khan**

* [LinkedIn](https://www.linkedin.com/in/fiza-kh/)
* [GitHub](https://github.com/)
