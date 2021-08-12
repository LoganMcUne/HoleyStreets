USE master
GO

--drop database if it exists
IF DB_ID('final_capstone') IS NOT NULL
BEGIN
	ALTER DATABASE final_capstone SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE final_capstone;
END

CREATE DATABASE final_capstone
GO

USE final_capstone
GO

--create tables
CREATE TABLE users (
	user_id int IDENTITY(1,1) NOT NULL,
	username varchar(50) NOT NULL,
	password_hash varchar(200) NOT NULL,
	salt varchar(200) NOT NULL,
	user_role varchar(50) NOT NULL
	CONSTRAINT PK_user PRIMARY KEY (user_id)
)

--pothole table
CREATE TABLE potholes (
	pothole_id int IDENTITY(1,1) NOT NULL,
	latitude decimal(8,6) NOT NULL,
	longitude decimal(9,6) NOT NULL,
	image_link varchar(300),
	reported_date DATE NOT NULL,
	reporting_user_id int NOT NULL,
	inspected_date DATE,
	repaired_date DATE,
	repair_status varchar(50),
	severity TINYINT,
		CONSTRAINT between_one_and_ten CHECK(severity >=1 AND severity <= 10),
	CONSTRAINT PK_potholes PRIMARY KEY (pothole_id),
	CONSTRAINT FK_user_to_pothole FOREIGN KEY (reporting_user_id) REFERENCES users(user_id)
)

-- Requests for users to become employees table
CREATE TABLE requests (
	request_id int IDENTITY(1,1) NOT NULL,
	user_id int NOT NULL,
	active_status bit NOT NULL,
	CONSTRAINT PK_requests PRIMARY KEY (request_id),
	CONSTRAINT FK_requests_to_users FOREIGN KEY (user_id) REFERENCES users(user_id)
)

--Claim forms
CREATE TABLE claims (
	claim_id INT IDENTITY(1,1) NOT NULL,
	user_id INT NOT NULL,
	first_name VARCHAR(100) NOT NULL,
	last_name VARCHAR(100) NOT NULL,
	email VARCHAR(345) NOT NULL,
	phone_number VARCHAR(20) NOT NULL,
	date_of_claim DATE NOT NULL,
	date_of_incident DATE NOT NULL,
	location_of_incident_city VARCHAR(120) NOT NULL,
	location_of_incident_state VARCHAR(120) NOT NULL,
	image_link VARCHAR(1200),
	description_of_damage VARCHAR(1200) NOT NULL,
	claim_status VARCHAR (30) NOT NULL DEFAULT 'Pending',
	CONSTRAINT PK_claims PRIMARY KEY (claim_id),
	CONSTRAINT FK_claims_to_users FOREIGN KEY (user_id) REFERENCES users(user_id)
)

--populate default data
INSERT INTO users (username, password_hash, salt, user_role) VALUES ('user','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user');
INSERT INTO users (username, password_hash, salt, user_role) VALUES ('admin','YhyGVQ+Ch69n4JMBncM4lNF/i9s=', 'Ar/aB2thQTI=','admin');
INSERT INTO users (username, password_hash, salt, user_role) VALUES ('employee','+evA40KNSwa/H67KO3dyrIGCRCc=','ERHtn4EGU9k=','employee');
INSERT INTO users (username, password_hash, salt, user_role) VALUES ('rejected','bJpe3BopB1nJs94HePre1Gchktw=','v5wtylq92QU=','user');
INSERT INTO users (username, password_hash, salt, user_role) VALUES ('pending1','ppX+UEfBTBjHB9oHBKt4hsIjHcM=','670msKfgokE=','user');
INSERT INTO users (username, password_hash, salt, user_role) VALUES ('pending2','V2CyqQMj78DWAhvPV1e/iJ9RN6o=','pbcLS6SbOqg=','user');
INSERT INTO users (username, password_hash, salt, user_role) VALUES ('pending3','IAM7JZf3uYcDVIGKrJBr388Wonc=','X3i9WS023/o=','user');

INSERT INTO potholes(latitude,longitude,image_link,reported_date, reporting_user_id, repair_status) VALUES (39.159490, -84.455277, 'https://sfpublicworks.org/sites/default/files/texas-pothole-635x424.jpg','8/2/2021',1, 'Reported');
INSERT INTO potholes(latitude,longitude,image_link,reported_date, inspected_date, reporting_user_id, repair_status) VALUES (39.145706, -84.527141, 'https://www.kttn.com/wp-content/uploads/2019/02/Pothole.jpg','8/2/2021','8/5/2021',2, 'Inspected');
INSERT INTO potholes(latitude,longitude,image_link,reported_date, inspected_date, reporting_user_id, repair_status) VALUES (39.180460, -84.501135, 'https://kdvr.com/wp-content/uploads/sites/11/2019/03/gettyimages-183851840.jpg','8/2/2021','8/9/2021',3, 'Inspected');
INSERT INTO potholes(latitude,longitude,image_link,reported_date, inspected_date, repaired_date, reporting_user_id, repair_status) VALUES (39.133231, -84.413645, 'https://media1.fdncms.com/chicago/imager/u/original/71086724/potholes010.jpg','8/2/2021','8/4/2021','8/11/2021',3, 'Repaired');
INSERT INTO potholes(latitude,longitude,image_link,reported_date, inspected_date, repaired_date, reporting_user_id, repair_status) VALUES (39.158086, -84.463604, 'https://www.thebalance.com/thmb/VlnrT3pRKvtegoumE0fXWmA4pWI=/2121x1193/smart/filters:no_upscale()/pothole-174662203-5a7dc84aae9ab80036c6ad36.jpg','8/2/2021','8/3/2021','8/5/2021',4, 'Repaired');
INSERT INTO potholes(latitude,longitude,image_link,reported_date, inspected_date, reporting_user_id, repair_status) VALUES (37.798505, -122.4583, 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/22/A_Pothole_Is_Decorated_-_Mid-City_New_Orleans.jpg/800px-A_Pothole_Is_Decorated_-_Mid-City_New_Orleans.jpg','8/7/2021','8/20/2021',2, 'Reported');
INSERT INTO potholes(latitude,longitude,image_link, reported_date, inspected_date, reporting_user_id, repair_status) VALUES (39.779730, -104.8827,'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b3/Pothole_in_an_asphalt_pavement.jpg/800px-Pothole_in_an_asphalt_pavement.jpg', '8/1/2021','8/5/2021',3, 'Inspected');
INSERT INTO potholes(latitude,longitude,image_link,reported_date, inspected_date, repaired_date, reporting_user_id, repair_status) VALUES (29.267419, -98.559569,'https://upload.wikimedia.org/wikipedia/commons/c/c7/Pothole_Big.jpg','8/2/2021','8/3/2021','8/11/2021',1, 'Repaired');
INSERT INTO potholes(latitude,longitude,image_link,reported_date, reporting_user_id, repair_status) VALUES (39.001061, -94.496286,'https://upload.wikimedia.org/wikipedia/commons/thumb/0/03/Clausius_crater_4148_h2_h3.jpg/600px-Clausius_crater_4148_h2_h3.jpg','8/7/2021',1, 'Reported');
INSERT INTO potholes(latitude,longitude,image_link,reported_date, inspected_date, reporting_user_id, repair_status) VALUES (46.829766, -96.803063,'https://upload.wikimedia.org/wikipedia/commons/thumb/8/84/Marked_Pothole.jpg/640px-Marked_Pothole.jpg','8/3/2021','8/4/2021',2, 'Inspected');
INSERT INTO potholes(latitude,longitude,image_link,reported_date, inspected_date, repaired_date,reporting_user_id, repair_status) VALUES (32.746343, -79.986972,'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5e/Sinkhole.jpg/800px-Sinkhole.jpg','8/6/2021','8/7/2021','8/8/2021', 4, 'Repaired');
INSERT INTO potholes(latitude,longitude, image_link,reported_date, inspected_date, reporting_user_id, repair_status) VALUES (39.324023, -82.105083,'https://upload.wikimedia.org/wikipedia/commons/thumb/9/91/Nuuksio_pothole.jpg/800px-Nuuksio_pothole.jpg','8/5/2021','8/6/2021',3, 'Inspected');
INSERT INTO potholes(latitude,longitude, image_link,reported_date, inspected_date, repaired_date, reporting_user_id, repair_status) VALUES (38.299890, -83.175415,'https://upload.wikimedia.org/wikipedia/commons/thumb/7/79/Gold_fish_in_a_pothole_11.jpg/800px-Gold_fish_in_a_pothole_11.jpg','8/1/2021', '8/2/2021','8/3/2021',2, 'Repaired');
INSERT INTO potholes(latitude,longitude,image_link,reported_date,reporting_user_id, repair_status) VALUES (29.619924, -82.359311, 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1e/Pothole%2C_Vas%C3%BAt_utca%2C_Zichy%C3%BAjfalu_001.jpg/800px-Pothole%2C_Vas%C3%BAt_utca%2C_Zichy%C3%BAjfalu_001.jpg','8/2/2021',1, 'Reported');

INSERT INTO requests (user_id, active_status) VALUES (1, 1);
INSERT INTO requests (user_id, active_status) VALUES (5, 1);
INSERT INTO requests (user_id, active_status) VALUES (6, 1);
INSERT INTO requests (user_id, active_status) VALUES (7, 1);

INSERT INTO claims (user_id, first_name, last_name, email, phone_number, date_of_claim, date_of_incident, location_of_incident_city, location_of_incident_state, image_link, description_of_damage) VALUES (1, 'Bob', 'Bobertson', 'bob@aol.com', '123-456-7890', '2021-08-10', '2021-08-03', 'Cincinnati', 'OH', 'https://www.gannett-cdn.com/presto/2019/02/22/PDTF/b7c4a04f-7f1a-44ac-b689-9516f1b7c7e5-52365689_2576383472378953_4680490136083890176_n.jpg?auto=webp&crop=719,404,x1,y190&format=pjpg&width=1200', 'My car is all messed up!');
GO
