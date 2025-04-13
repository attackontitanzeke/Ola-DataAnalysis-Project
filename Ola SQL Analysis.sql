Create database Ola;

use Ola;
select count(*) from bookings;


-- 1. Retrieve all successful bookings:

create view Successful_Bookings as
select * 
from bookings
where Booking_Status = "Success";

select * from Successful_Bookings;

-- 2. Find the average ride distance for each vehicle type:

create view Ride_Distance_For_Each_Vehicle as
select Vehicle_Type, Avg(Ride_Distance) as Average_Distance
from bookings
group by Vehicle_Type;

select * from Ride_Distance_For_Each_Vehicle;

-- 3. Get the total number of cancelled rides by customers:

create view Canceled_Ride as
select count(*) 
from bookings
where Booking_Status = "Canceled by Customer";

-- 4. List the top 5 customers who booked the highest number of rides:

Create View Top_5_Customers As
select Customer_ID, count(*) as Total_Rides
from bookings
group by Customer_ID
order by Total_Rides DESC
limit 5;


-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:

Create View Rides_cancelled_by_Drivers_P_C_Issues As
select count(*) 
from bookings
where Canceled_Rides_by_Driver = "Personal & Car related issue";

-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:

Create View Max_Min_Driver_Rating As
select max(Driver_Ratings) as Max_Driver_Ratings, min(Driver_Ratings) as Min_Driver_Ratings
from bookings
where Vehicle_Type = "Prime Sedan";

-- 7. Retrieve all rides where payment was made using UPI:

Create View UPI_Payment As
select *
from bookings
where Payment_Method = "UPI";

-- 8. Find the average customer rating per vehicle type:

Create View AVG_Cust_Rating As
select Vehicle_Type ,avg(Customer_Rating)
from bookings
group by Vehicle_Type;

-- 9. Calculate the total booking value of rides completed successfully:

Create View total_successful_ride_value As
select sum(Booking_Value) as Total_Booking_Value
from bookings
where Booking_Status = "Success";

-- 10. List all incomplete rides along with the reason:

Create View Incomplete_Rides_Reason As
select Booking_ID,Incomplete_Rides, Incomplete_Rides_Reason
from bookings
where Incomplete_Rides = "Yes";



