# BookMyShow Database Schema

This project contains the SQL scripts required to set up the 'BookMyShow' ticket booking platform database. The schema includes entities like theatres, movies, shows, bookings, seats, and their relationships. It ensures the data adheres to normalization rules (1NF, 2NF, 3NF, and BCNF).

## **Table of Contents**

- [Entities and Relationships](#entities-and-relationships)
- [SQL File](#sql-file)
- [Sample Data](#sample-data)
- [Queries](#queries)
- [Setup Instructions](#setup-instructions)

## **Entities and Relationships**

The following entities are represented in the database schema:

1. **Theatre**: Stores details about theatres.
2. **Movie**: Stores details about movies.
3. **Show**: Stores show timings and links movies with theatres.
4. **Booking**: Tracks user bookings.
5. **Seat**: Stores seat details for each theatre.
6. **Show_Seat**: Tracks seat availability for each show.

## **SQL File**

The `bookmyshow.sql` file contains:
- Table creation statements
- Sample data insertion statements
- A query to list all shows on a given date at a given theatre

## **Sample Data**

The sample data includes:
- Two theatres (PVR)
- A set of seat entries and booking records

## **Queries**

### Example Query to list all shows on a given date at a given theatre:
```sql
SELECT 
    s.show_id, 
    m.title AS Movie_Title, 
    s.show_time 
FROM 
    shows s 
JOIN 
    movies m ON s.movie_id = m.movie_id
JOIN 
    theatres t ON s.theatre_id = t.theatre_id
WHERE 
    s.show_date = '2024-04-25' 
    AND t.name = 'PVR';


Setup Instructions
    1. Prerequisites
         MySQL Server installed on your local machine.
         A MySQL client such as MySQL Workbench or access to the command line interface.
         
    2. Running the SQL Script
        Save the bookmyshow.sql file in your preferred location.
        Open your MySQL database environment (MySQL Workbench, CLI, etc.).
        Create a new database (optional but recommended):
   
    CREATE DATABASE bookmyshow_ticket_system;
    USE bookmyshow_ticket_system;
    Execute the script:
    If using MySQL CLI:
   
    mysql -u yourusername -p bookmyshow_ticket_system < bookmyshow.sql
    Replace yourusername with your MySQL username.
    If using MySQL Workbench, open and run the bookmyshow.sql file.

    3. Viewing Data and Testing the Query
       After running the script, the tables will be created with sample data.
        Use the provided query to test the systems ability to fetch show details based on a given date and theatre.

Project Structure

    bookmyshow.sql : SQL script for table creation and data insertion.

Contributing

    Feel free to fork the repository, make modifications, and submit a pull request for any improvements.