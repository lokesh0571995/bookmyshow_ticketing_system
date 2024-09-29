-- Create Theatre Table
CREATE TABLE theatres (
    theatre_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(255) NOT NULL
);

-- Create Movie Table
CREATE TABLE movies (
    movie_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    genre VARCHAR(100),
    duration INT,
    language VARCHAR(100)
);

-- Create Show Table
CREATE TABLE shows (
    show_id INT AUTO_INCREMENT PRIMARY KEY,
    movie_id INT,
    theatre_id INT,
    show_date DATE,
    show_time TIME,
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id),
    FOREIGN KEY (theatre_id) REFERENCES theatres(theatre_id)
);

-- Create Booking Table
CREATE TABLE bookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    show_id INT,
    user_name VARCHAR(100),
    seats_booked INT,
    booking_date DATETIME,
    FOREIGN KEY (show_id) REFERENCES shows(show_id)
);

-- Create Seat Table
CREATE TABLE seats (
    seat_id INT AUTO_INCREMENT PRIMARY KEY,
    theatre_id INT,
    seat_number VARCHAR(10),
    FOREIGN KEY (theatre_id) REFERENCES theatres(theatre_id)
);

-- Create Show_Seat Table
CREATE TABLE show_seats (
    show_seat_id INT AUTO_INCREMENT PRIMARY KEY,
    seat_id INT,
    show_id INT,
    status ENUM('Available', 'Booked') DEFAULT 'Available',
    FOREIGN KEY (seat_id) REFERENCES seats(seat_id),
    FOREIGN KEY (show_id) REFERENCES shows(show_id)
);

-- Insert sample data into Theatre Table
INSERT INTO theatres (name, location) VALUES ('PVR', 'Nexus (Forum Mall)');


-- Insert sample data into Movie Table
INSERT INTO movies (title, genre, duration, language) VALUES ('Dasara', 'Drama', 148, 'Telugu');
INSERT INTO movies (title, genre, duration, language) VALUES ('Kisi Ka Bhai Kisi Ki Jaan', 'Drama', 161, 'Hindi');
INSERT INTO movies (title, genre, duration, language) VALUES ('Tu Jhoothi Main Makkaar', 'Romantic Comedy', 164, 'Hindi');
INSERT INTO movies (title, genre, duration, language) VALUES ('Avatar: The Way of Water', 'Action', 192, 'English');


-- Insert sample data into Show Table
-- Shows for 'Dasara'
INSERT INTO shows (movie_id, theatre_id, show_date, show_time) VALUES (1, 1, '2024-04-25', '12:15:00');

-- Shows for 'Kisi Ka Bhai Kisi Ki Jaan'
INSERT INTO shows (movie_id, theatre_id, show_date, show_time) VALUES (2, 1, '2024-04-25', '01:00:00');
INSERT INTO shows (movie_id, theatre_id, show_date, show_time) VALUES (2, 1, '2024-04-25', '04:10:00');
INSERT INTO shows (movie_id, theatre_id, show_date, show_time) VALUES (2, 1, '2024-04-25', '06:20:00');
INSERT INTO shows (movie_id, theatre_id, show_date, show_time) VALUES (2, 1, '2024-04-25', '07:30:00');
INSERT INTO shows (movie_id, theatre_id, show_date, show_time) VALUES (2, 1, '2024-04-25', '10:30:00');

-- Shows for 'Tu Jhoothi Main Makkaar'
INSERT INTO shows (movie_id, theatre_id, show_date, show_time) VALUES (3, 1, '2024-04-25', '01:15:00');

-- Shows for 'Avatar: The Way of Water'
INSERT INTO shows (movie_id, theatre_id, show_date, show_time) VALUES (4, 1, '2024-04-25', '01:20:00');


-- Insert sample data into Seat Table
INSERT INTO seats (theatre_id, seat_number) VALUES (1, 'A1');
INSERT INTO seats (theatre_id, seat_number) VALUES (1, 'A2');
INSERT INTO seats (theatre_id, seat_number) VALUES (1, 'A3');



-- Insert sample data into Booking Table
INSERT INTO bookings (show_id, user_name, seats_booked, booking_date) VALUES (1, 'John Doe', 2, '2024-04-24 10:00:00');


-- Insert sample data into Show_Seat Table
INSERT INTO show_seats (seat_id, show_id, status) VALUES (1, 1, 'Booked');
INSERT INTO show_seats (seat_id, show_id, status) VALUES (2, 1, 'Available');
INSERT INTO show_seats (seat_id, show_id, status) VALUES (3, 2, 'Available');



-- Query to list all shows on a given date at a given theatre along with their respective show timings
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

