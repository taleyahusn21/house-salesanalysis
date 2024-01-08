--showing detail of the tables
Select * from dates_price;
Select * from house_details;
Select * from zip;

--Counting the number of records in each table
Select count(*) from dates_price;
Select count(*) from house_details;
Select count(*) from zip;

--counting the number of single family house in each city;
Select city, count(*) from house_details where home_type = 'Single Family' group by city;

--zipcode with highest population
Select city from zip where 
zip_code_population = (Select max(zip_code_population) from zip);

--average size of the house
Select avg(house_size) as average_size_of_house from house_details;

--distribution of houses in different cities
Select city, count(*) as no_of_houses_in_the_city from house_details group by city;

--join(to see the status of house)
Select house_details.id, home_type, status from house_details inner join dates_price on
house_details.id = dates_price.id;

--average time spent in market
Select avg(sold_date-listing_date) as avg_time_spent_in_market from dates_price;

--avg price of house sold in a zipcode
Select avg(actual_sold_price) as avg_house_price, zip_code from dates_price inner join house_details on
house_details.id = dates_price.id group by zip_code;

--checking if there is null value in swimming tank
select * from house_details where swimming_tank is null;

--union all (Selecting distinct id)
select id from house_details union all 
select id from dates_price;
