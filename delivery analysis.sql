create database skincare;
use skincare;
select * from supply_chain_data;
#1 What is the total number of orders?
select count(*) from supply_chain_data;
#2 What is the average shipping time?
select avg(shipping_times) from supply_chain_data;
#3 What is the average lead time?
select avg(lead_time) from supply_chain_data;
#4 What is the maximum shipping time?
select max(shipping_times) from supply_chain_data;
#5 What is the minimum shipping time?
select min(shipping_times) from supply_chain_data;
#6 What is the maximum lead time?
select max(lead_time) from supply_chain_data;
#7 What is the minimum lead time?
select min(lead_time) from supply_chain_data;
#8 What is the average order quantity?
select avg(order_quantities) from supply_chain_data;
#9 What is the total shipping cost?
select sum(shipping_costs) from supply_chain_data;
#10 What is the average shipping cost per order?
select avg(shipping_costs) from supply_chain_data;
#11 What is the average shipping time for each shipping carrier?
select shipping_carriers,avg(shipping_times) from supply_chain_data group by shipping_carriers;
#12 What is the average shipping cost for each shipping carrier?
select shipping_carriers,avg(shipping_costs) from supply_chain_data group by shipping_carriers;
#13 How many orders are handled by each carrier?
select shipping_carriers,count(*) from supply_chain_data group by shipping_carriers;
#14 Which carrier has the longest average shipping time?
select shipping_carriers,avg(shipping_times) as average_shipping_time from supply_chain_data group by shipping_carriers order by average_shipping_time desc limit 1 ;
#15 Which carrier has the shortest average shipping time?
select shipping_carriers,avg(shipping_times) as average_shipping_time from supply_chain_data group by shipping_carriers order by average_shipping_time asc limit 1 ;
#16 Which carrier has the highest average shipping cost?
select shipping_carriers,avg(shipping_costs) as average_cost from supply_chain_data group by shipping_carriers order by average_cost desc limit 1;
#17 Which carrier handles the highest number of orders?
select shipping_carriers,count(*) as no_of_orders from supply_chain_data group by shipping_carriers order by no_of_orders desc limit 1;
#18 What is the average shipping time for each transportation mode?
select transportation_modes,avg(shipping_times) as average_shipping_time from supply_chain_data group by transportation_modes;
#19 What is the average shipping cost for each transportation mode?
select transportation_modes,avg(shipping_costs) as average_shipping_cost from supply_chain_data group by transportation_modes;
#20 How many orders use each transportation mode?
select transportation_modes,count(*) as no_of_orders from supply_chain_data group by transportation_modes;
#21 Which transportation mode has the longest average delivery time?
select transportation_modes,avg(shipping_times) as average_shipping_time from supply_chain_data group by transportation_modes order by average_shipping_time desc limit 1;
#22 Which transportation mode has the highest average shipping cost?
select transportation_modes,avg(shipping_costs) as average_shipping_cost from supply_chain_data group by transportation_modes order by average_shipping_cost desc limit 1;
#23 What is the average shipping time for each route?
select routes,avg(shipping_times) as average_shipping_time from supply_chain_data group by routes;
#24 What is the average shipping cost for each route?
select routes,avg(shipping_costs) as average_shipping_cost from supply_chain_data group by routes;
#25 Which routes have the longest shipping times?
select routes,max(shipping_times) as longest_shipping_times from supply_chain_data group by routes;
#26 Which routes have the highest shipping costs?
select routes,max(shipping_costs) as highest_shipping_costs from supply_chain_data group by routes;
#27 Which routes have both high shipping time and high shipping cost?
SELECT routes,
       shipping_times,
       shipping_costs
FROM supply_chain_data
WHERE shipping_times > (
          SELECT AVG(shipping_times)
          FROM supply_chain_data
      )
  AND shipping_costs > (
          SELECT AVG(shipping_costs)
          FROM supply_chain_data
      );
#28 What is the average shipping time by product type?
select product_type, avg(shipping_times) as average_shipping_time from supply_chain_data  group by product_type;
#29 What is the average shipping cost by product type?
select product_type, avg(shipping_costs)  as average_shipping_costs from  supply_chain_data  group by product_type;
#30 What is the average shipping time by location?
select location,avg(shipping_times) as average_shipping_time from supply_chain_data group by location;
#31 Which locations have the longest shipping times?
select location,max(shipping_times) as longest_shipping_times from supply_chain_data group by location;
#32 Which locations have the highest shipping costs?
select location,max(shipping_costs) as highest_shipping_costs from supply_chain_data group by location ;
#33 Rank shipping carriers by average shipping time.
 with sc_cte as (select shipping_carriers,avg(shipping_times) as average_shipping_time from supply_chain_data group by shipping_carriers)
 select * ,rank() over(order by average_shipping_time desc) as rnk from sc_cte;

#34 Rank shipping carriers by average shipping cost.
 with sc_cte as (select shipping_carriers,avg(shipping_costs) as average_shipping_cost from supply_chain_data group by shipping_carriers)
 select * ,rank() over(order by average_shipping_cost desc) as rnk from sc_cte;

#35 Find carriers whose average shipping time is higher than the overall average.
select shipping_carriers,avg(shipping_times) from supply_chain_data group by shipping_carriers having avg(shipping_times)>(select avg(shipping_times) from supply_chain_data);
#38 Find routes whose shipping cost is higher than the overall average shipping cost.
select routes,avg(shipping_costs) from supply_chain_data group by routes having avg(shipping_costs)>(select avg(shipping_costs) from supply_chain_data);
#39 Find transportation modes whose average shipping time is below the overall average.
select transportation_modes,avg(shipping_times) from supply_chain_data group by transportation_modes having avg(shipping_times)>(select avg(shipping_times) from supply_chain_data);
#40 Calculate each carrier's percentage contribution to total shipping cost.
with tsc_cte as (select shipping_carriers,sum(shipping_costs) as total_shipping_cost from supply_chain_data group by shipping_carriers)
select shipping_carriers,total_shipping_cost,round(total_shipping_cost*100/(select sum(shipping_costs) from supply_chain_data),2) as percentage_contribution from tsc_cte;
#41 Calculate the difference between each carrier's average shipping time and the overall average shipping time.
with ast_cte as (select shipping_carriers,avg(shipping_times) as average_shipping_times from supply_chain_data group by shipping_carriers)
select shipping_carriers,(average_shipping_times-(select avg(shipping_times) from supply_chain_data)) as difference from ast_cte;
#42 Identify routes with high shipping time and high shipping cost.
select routes ,shipping_times,shipping_costs from supply_chain_data where shipping_times>(select avg(shipping_times) from supply_chain_data) and shipping_costs>(select avg(shipping_costs) from supply_chain_data);
#43 Identify carriers with low shipping time and low shipping cost.
select shipping_carriers ,shipping_times,shipping_costs from supply_chain_data where shipping_times<(select avg(shipping_times) from supply_chain_data) and shipping_costs<(select avg(shipping_costs) from supply_chain_data);
#44 Rank routes within each transportation mode based on shipping time.
 select routes,transportation_modes,shipping_times,dense_rank()over(partition by transportation_modes order by shipping_times desc) as rnk from supply_chain_data;
#45 Find the highest-cost route for each transportation mode.
WITH route_cost AS (
    SELECT
        routes,
        transportation_modes,
        SUM(costs) AS total_cost
    FROM supply_chain_data
    GROUP BY routes, transportation_modes
)
SELECT
    routes,
    transportation_modes,
    total_cost
FROM (
    SELECT
        *,
        RANK() OVER (
            PARTITION BY transportation_modes
            ORDER BY total_cost DESC
        ) AS rnk
    FROM route_cost
) t
WHERE rnk = 1;
select * from supply_chain_data where shipping_times>(select avg(shipping_times) from supply_chain_data); 
