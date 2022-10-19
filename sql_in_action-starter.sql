-- <<<<<<<<<<<<<<<<<<<<<<< EXAMPLE >>>>>>>>>>>>>>>>>>>>>>>>
-- TODO: Remove the "--" from the below SELECT query and run the query
--    NOTE: When writing queries, make sure each one ends with a semi-colon

-- SELECT * FROM final_airbnb;

-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 1 >>>>>>>>>>>>>>>>>>>>>>>
-- Find out how many rows are in the table "final_airbnb"
select count(*) from final_airbnb;
-- EXPECTED OUTPUT: 146


-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 2 >>>>>>>>>>>>>>>>>>>>>>>
-- Find out the name of the host for "host_id" 63613
select id, host_id, host_name from final_airbnb
where host_id = 63613;
-- HINT: "Where" could it be?

-- EXPECTED OUTPUT: Patricia


-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 3 >>>>>>>>>>>>>>>>>>>>>>>
-- Query the data to just show the unique neighbourhoods listed
select distinct neighbourhood from final_airbnb;

-- HINT: This is a "distinct" operation...final_airbnb

-- EXPECTED OUTPUT: 40 neighbourhoods listed


-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 4 >>>>>>>>>>>>>>>>>>>>>>>

-- Find both the highest price listing and the lowest price listing, displaying the entire row for each
select max(price) 
from final_airbnb;

select min(price)
from final_airbnb;
-- HINT: This can be two different queries.

-- FOOD FOR THOUGHT: Think about the results. Are the high and low prices outliers in this data set?

-- EXPECTED OUTPUT: Highest = 785, Lowest = 55


-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 5 >>>>>>>>>>>>>>>>>>>>>>>
-- Find the average availability for all listings in the data set (using the availability_365 column)
-- HINT: Aggregates are more than just big rocks...
select avg(availability_365) 
from final_airbnb;

-- EXPECTED OUTPUT: 165.3904


-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 6 >>>>>>>>>>>>>>>>>>>>>>>
-- Find all listings that do NOT have a review
-- HINT: There are a few ways to go about this. Remember that an empty cell is "no value", but not necessarily NULL
select id, host_id, host_name from final_airbnb
where last_review = 0;
-- EXPECTED OUTPUT: 6 rows


-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 7 >>>>>>>>>>>>>>>>>>>>>>>
-- Find the id of the listing with a room_type of "Private room" that has the most reviews 
-- HINT: Sorting is your friend!
select id  from final_airbnb
where room_type = "Private room" and max(number_of_reviews);
-- EXPECTED OUTPUT: 58059


-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 8 >>>>>>>>>>>>>>>>>>>>>>>
-- Find the most popular neighbourhood for listings 
-- HINT: Look for which neighbourhood appears most frequently in the neighbourhood column
-- HINT: You are creating "summary rows" for each neighbourhood, so you will just see one entry for each neighbourhood
select neighbourhood, count(neighbourhood) 
from final_airbnb group by neighbourhood order by count(*) desc;

-- EXPECTED OUTPUT: Williamsburg
-- INVESTIGATE: Should Williamsburg be crowned the most popular neighbourhood?
-- It is tied with Harlem for both entries have 16 listings. Also, as popular neighbourhood is different from popular neighborhood for
-- listings, that would imply the most popular neighborhood is the one with the Least listings, as homeowners/renters are more likely to
-- stay. This has several neighbourhoods as the most popular neighbourhood, but not as popular for neighbourhood listings.

-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 9 >>>>>>>>>>>>>>>>>>>>>>>
-- Query the data to discover which listing is the most popular using the reviews_per_month for all listings with a minimum_nights value of less than 7
-- HINT: Sorting is still your friend! So are constraints.
select id, host_id, host_name, minimum_nights from final_airbnb
where minimum_nights<7
order by  reviews_per_month desc
limit 1;

-- EXPECTED OUTPUT: 58059
-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 10 >>>>>>>>>>>>>>>>>>>>>>>
-- Find out which host has the most listings. 
-- Create a NEW column that will show a calculation for how many listings the host for each listing has in the table
-- Display the column using aliasing.
-- HINT: Work this one step at a time. See if you can find a way to just display the count of listings per host first.
select host_name, count(host_name) as Host_Count from final_airbnb 
group by host_name 
order by Host_Count desc
limit 1;

-- EXPECTED OUTPUT: The Box House Hotel with 6 listings


-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 11 >>>>>>>>>>>>>>>>>>>>>>>
-- <<<<<<<<<<<<<<<<<<<<<<< WRAP UP >>>>>>>>>>>>>>>>>>>>>>>>>
-- What do you think makes a successful AirBnB rental in this market? What factors seem to be at play the most?
-- Write a few sentences and include them with your project submission in the README file 
-- A successful AirBnB unit is one that generates consistent or predictable cash flow with minimal
-- maintainence and issues. Given the recent scandals associated with AirBnB, a listing that makes less 
-- but is less noteworthy and is never in the news will likely generate more profits at a consistent
-- rate. Unless the accomodations are particularly pleasant relative to the cost, it might be 
-- possible that fewer, rather than more, reviews are more ideal, as review posters across 
-- all industries tend towards negative. A rough calculation should be made for each listing that 
-- takes in the average stay duration in days, the average gross profits, a comparison to 
-- average ongoing maintainence, and predicted repair/cleaning costs. Certain listings might be 
-- more lucrative as the maintainence costs are lower and the anticipated clientelle create less
-- less cleaning costs. 

-- <<<<<<<<<<<<<<<<<<<<< ** BONUS ** >>>>>>>>>>>>>>>>>>>>>>>
-- Find the the percent above or below each listing is compared to the average price for all listings.
-- HINT: No hints! It's a bonus for a reason :)

