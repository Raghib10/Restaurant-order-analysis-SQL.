SELECT * FROM restaurant_db.menu_items;

-- view the menu items tables--
select * from menu_items;
-- find the numbers of items on the menu--
select count(*) from menu_items;
-- what are the least and most expensive items of the menu--
select * from menu_items
order by price desc;
-- How many italian dishes are on the menu--
select count(*) from menu_items
where category = "italian";
-- what are the least and most expensive italian dishes on the menu--
select * from menu_items
where category = "italian"
order by price;
-- How many dishes are in each category__
select category, count(menu_item_id) as num_dishes
from menu_items
group by category;
-- what is the average dish price within each category--
select category, avg(price) as avg_price
from menu_items
group by category;
-- what is the date range of tabel--
select * from order_details
order by order_date;
-- how many orders were made within this date range--
select count(distinct order_id) from order_details;
-- how many items were ordered within this date range--
select * from order_details;
-- which orders had most numbers of items--
select order_id,count(item_id) as num_items
from order_details
group by order_id ;
-- how many orders had more than 12 items--
select count(*) from
(select order_id,count(item_id) as num_items
from order_details
group by order_id 
having num_items>12) as num_orders;
-- combine menu_items and order_details tables into single table--
select * from order_details od
left join menu_items mi
on od.item_id= mi.menu_item_id;
-- what were the least and most ordered items.what categories were they in--
select item_name, category, count(order_details_id) as num_purchase
from order_details od
left join menu_items mi
on od.item_id= mi.menu_item_id
group by item_name, category
order by num_purchase;
-- what were the top 5 orders that spend the most money--
select order_id, sum(price)as total_spend
from order_details od
left join menu_items mi
on od.item_id= mi.menu_item_id
group by order_id
order by total_spend desc
limit 5;
-- view the details of highest spend order. 
select category, count(item_id) as num_items
from order_details od
left join menu_items mi
on od.item_id= mi.menu_item_id
where order_id= 440
group by category;
--  view the details of the top 5 highest spend order--
select order_id, category, count(item_id) as num_items
from order_details od
left join menu_items mi
on od.item_id= mi.menu_item_id
where order_id in (440,2075,1957,330,2675)
group by order_id, category;
