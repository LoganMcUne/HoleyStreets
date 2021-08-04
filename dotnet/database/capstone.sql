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
	longitude decimal(8,6) NOT NULL,
	image_link varchar(150),
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

--joiner of user and pothole
--CREATE TABLE user_pothole (
--	user_id int NOT NULL,
--	pothole_id int NOT NULL,
--	CONSTRAINT PK_user_pothole PRIMARY KEY (user_id, pothole_id),
--	CONSTRAINT FK_user_to_pothole FOREIGN KEY (user_id) REFERENCES users(user_id),
--	CONSTRAINT FK_pothole_to_user FOREIGN KEY (pothole_id) REFERENCES potholes(pothole_id)
--)

--populate default data
INSERT INTO users (username, password_hash, salt, user_role) VALUES ('user','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user');
INSERT INTO users (username, password_hash, salt, user_role) VALUES ('admin','YhyGVQ+Ch69n4JMBncM4lNF/i9s=', 'Ar/aB2thQTI=','admin');
INSERT INTO users (username, password_hash, salt, user_role) VALUES ('employee','+evA40KNSwa/H67KO3dyrIGCRCc=','ERHtn4EGU9k=','employee');
INSERT INTO users (username, password_hash, salt, user_role) VALUES ('rejected','bJpe3BopB1nJs94HePre1Gchktw=','v5wtylq92QU=','user');
INSERT INTO users (username, password_hash, salt, user_role) VALUES ('pending1','ppX+UEfBTBjHB9oHBKt4hsIjHcM=','670msKfgokE=','user');
INSERT INTO users (username, password_hash, salt, user_role) VALUES ('pending2','V2CyqQMj78DWAhvPV1e/iJ9RN6o=','pbcLS6SbOqg=','user');
INSERT INTO users (username, password_hash, salt, user_role) VALUES ('pending3','IAM7JZf3uYcDVIGKrJBr388Wonc=','X3i9WS023/o=','user');

INSERT INTO potholes(latitude,longitude,reported_date, reporting_user_id, repair_status) VALUES (39.159490, -84.455277, '8/2/2021',1, 'Reported');
INSERT INTO potholes(latitude,longitude,reported_date, reporting_user_id, repair_status) VALUES (39.145706, -84.527141, '8/2/2021',2, 'Reported');
INSERT INTO potholes(latitude,longitude,reported_date, reporting_user_id, repair_status) VALUES (39.180460, -84.501135, '8/2/2021',3, 'Reported');
INSERT INTO potholes(latitude,longitude,reported_date, reporting_user_id, repair_status) VALUES (39.133231, -84.413645, '8/2/2021',3, 'Reported');
INSERT INTO potholes(latitude,longitude,reported_date, reporting_user_id, repair_status) VALUES (39.158086, -84.463604, '8/2/2021',4, 'Reported');

INSERT INTO requests (user_id, active_status) VALUES (1, 1);
INSERT INTO requests (user_id, active_status) VALUES (5, 1);
INSERT INTO requests (user_id, active_status) VALUES (6, 1);
INSERT INTO requests (user_id, active_status) VALUES (7, 1);
GO
