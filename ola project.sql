Create Database Ola;
Use Ola;

-- Retrieve all successful bookings:

Select* From booking
where booking_status = "Success";

-- Find the average ride distance for each vehicle type:
Select Vehicle_Type, AVG(Ride_Distance) 
as avg_distance from booking 
Group by Vehicle_type;

-- Get the total number of cancelled rides by customers:
Select COUNT(Booking_ID) From booking
where booking_status = "Canceled by Customer";

-- List the top 5 customers who booked the highest number of rides:
Select Customer_ID, COUNT(Booking_ID) as total_ride From booking
Group by Customer_ID
Order by total_ride desc limit 5;


-- Get the number of rides cancelled by drivers due to personal and car-related issues:
Select COUNT(Booking_ID) From booking
where Canceled_Rides_by_Driver = "Personal & Car related issue";


-- Find the maximum and minimum driver ratings for Prime Sedan bookings:
Select Max(Customer_rating) as Max_Rating, 
Min(Customer_rating) as Min_Rating from booking
where Vehicle_type ="Prime Sedan";


-- Retrieve all rides where payment was made using UPI:
Select * From booking
where Payment_Method = "UPI";


-- Find the average customer rating per vehicle type:
Select Vehicle_type, round(Avg(Customer_Rating),2) From booking
Group by Vehicle_type;


-- Calculate the total booking value of rides completed successfully:
Select sum(Booking_Value) from booking
where Booking_Status ="Success";

-- List all incomplete rides along with the reason:
Select Booking_ID, Incomplete_Rides_Reason from booking
where Incomplete_Rides ="Yes";