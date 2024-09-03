/*first we look the load data by passing two cammands given below*/

use db;
select * from dataset_ordets;

/*again we reload the data by append so we need to drop table*/

use db;
drop table dataset_orders;

/*now we will create table again*/

CREATE TABLE dataset_orders (
order_id int primary key
, order_date date 
, ship_mode varchar(20)
, segment varchar(20)
, country varchar(20)
, city varchar(20)
, state varchar(20)
, postal_code varchar(20)
, region varchar(20)
, category varchar(20)
, sub_category varchar(20)
, product_id varchar(50)
, quantity int
, discount decimal(7,2)
, sale_price decimal(7,2)
, profit  decimal(7,2));

/*Again will print dataset_orders*/

USE db;
drop table dataset_orders;

/*So the above method is not working we will change the datatype of each column manually*/

ALTER TABLE dataset_orders
MODIFY COLUMN order_id int primary key;

ALTER TABLE dataset_orders
MODIFY  COLUMN order_date date, 
MODIFY  COLUMN ship_mode varchar(20),
MODIFY segment varchar(20),
MODIFY country varchar(20),
MODIFY city varchar(20),
MODIFY state varchar(20),
MODIFY postal_code varchar(20),
MODIFY region varchar(20),
MODIFY category varchar(20),
MODIFY sub_category varchar(20),
MODIFY product_id varchar(50),
MODIFY quantity int,
MODIFY discount decimal(7,2),
MODIFY sale_price decimal(7,2),
MODIFY profit  decimal(7,2);

use db;
select * from dataset_orders;

/*find top ten hightest revenue generating products*/

SELECT  product_id,sum(sale_price) as sales
FROM dataset_orders
group by product_id
order by sales desc
limit 10;

/*find top 5 highest selling products in each region*/

SELECT distinct region from dataset_orders;

WITH cte as (
SELECT region,sum(sale_price) as sales
FROM dataset_orders
group by region, product_id)

SELECT * FROM (

SELECT *
, row_number() over(partition by region order by sales desc) as rn
FROM cte) A
WHERE rn <= 5;

/*find month over month growth comparin for 2022 and 2023 sales eg : jan 22 vs 2023*/

WITH cte as (
SELECT year(order_date) as order_year, month(order_date) as order_month,
sum(sale_price) as sales FROM dataset_orders
GROUP BY year(order_date), month(order_date)
/*ORDER BY year(order_date), month(order_date)*/
	       )    
           
SELECT order_month
, sum( case when order_year-2022 then sales else 0 end) as sales 2022 
, sum(case when order_year-2023 then sales else 0 end) as sales 2023
FROM cte  
ORDER BY order_month         
GROUP BY order_month;	/*This query is showing error check why*/

/*for each category which month had highest sales*/

WITH cte as (
SELECT category, format(order_date,'yyyymm') as order_year_month
, sum(sale_price) as sales 
FROM dataset_orders
GROUP BY category, format(order_date,'yyyymm')
)
SELECT * FROM (
SELECT *,
row_number()over(partition by category order by sales DESC) as rn
FROM cte
) a 
WHERE rn=1











