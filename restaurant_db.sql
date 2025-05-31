select * from order_details;

--understanding the questions
--understanding the tables that you need 
--understanding the columns that you Need
--understanding the syntax like aggregation, order by, filter(where, having clause),limit
--to be used

--find the numbers of items on the menu?
--menu_items
__menu_items_id

select count(*) as numberofitemsonmeuu from menu_items;

or 

select count(menu_item_id) as numberofitemsonmenu from menu_items;



--what are the least and most expensive items on the menu?
--menuitems
--item name and itemid and price


select item_name , price from menu_items
order by price;
-- this is the least price itemss

---while the expensive items on the menu
select item_name , price from menu_items
order by price desc;

--how many italian dishes are on the menu
--menuitems
--category and italian
--where

select count(category) as italiandishes from menu_items
where category = 'Italian';

or 

select count(*) as italiandishes from menu_items
where category = 'Italian';

--what are the least and espensive italian dishes on the menu
-- menuitems TABLE
--- price category itemname
--where
-- first least
select * from menu_items
where category = 'Italian'
order by price;

---expensive 
select * from menu_items
where category = 'Italian'
order by price desc;

--how many dishes are in each category
--menu item TABLE
--item name and category
--group by count

select category, count(item_name) as numberofdishes from menu_items
group by category
order by category;

--what is the avergae dish price with each category
--menu items
--category and price
--average and group by order BY

select category, round(avg(price), 2) as avgprice from menu_items
group by category
order by category;

--understanding the questions
--understanding the tables that you need 
--understanding the columns that you Need
--understanding the syntax like aggregation, order by, filter(where, having clause),limit
--to be used

---what is the data range of the table?
--orderdetails TABLE
-- min to check the start date and max the current date or end date

select min(order_date), max(order_date) from order_details;

--how many orders were made within the date range?
--orderdetails TABLE
--orders made win the date range 01-01-2023 to 31-03-2023
--orderid

select count(distinct order_id) from order_details;



--how many items were ordered within this date range?
--item_id is used here

select count(item_id) from order_details;

--which orders had the most number of items?
--order id and item ID
--count 

select order_id , count (item_id) as numofitems from order_details
group by order_id
order by count (item_id) desc;

--how many orders had more than 12 items
--to find the total number of orders for more than 12 items we used subquery

select count(*) as nooforders from 

(select order_id , count (item_id) as numofitems from order_details
group by order_id
having count(item_id)  > 12);

--understanding the questions
--understanding the tables that you need 
--understanding the columns that you Need
--understanding the syntax like aggregation, order by, filter(where, having clause),limit
--to be used


--Combine the menu_items and order_details.
--JOIN

SELECT * FROM ORDER_DETAILS 
JOIN MENU_ITEMS ON ORDER_DETAILS.item_id = MENU_ITEMS.menu_item_id;

--What were the least and most ordered items? what categories were they in?
--order_details_id and item_name
--join group BY

select item_name, category, count(order_details_id) as ordereditems from order_details
join menu_items on order_details.item_id = menu_items.menu_item_id
group by item_name, category
order by count(order_details_id)desc;

--What were the top 5 orders that spent the most money?

select order_id, sum(price) from order_details join menu_items on order_details.item_id = menu_items.menu_item_id
group by order_id
order by sum(price) desc
limit 5;

--View the details of the highest spend order. what insights can you gather from the result?
-- so the highest spend order is 440 so want the details of what make up this order and that amount spent
--category, item_id or order_id

select category, count(order_id) as orderdetails from order_details join menu_items on order_details.item_id = menu_items.menu_item_id
where order_id = 440
group by category;


--View the details of the top 5 highest spend orders. what insights can you gather from the results?
-- so we want the details for the top 5 too and the top 5 are 440,2075,1957,330,2675
--where and join and count


select order_id,category, count(order_id) as orderdetails from order_details 
join menu_items on order_details.item_id = menu_items.menu_item_id
where order_id in (440, 2075, 1957, 330, 2675)
group by order_id, category;
