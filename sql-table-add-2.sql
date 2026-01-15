START TRANSACTION;

DROP TABLE IF EXISTS user_lessons, tasks, lessons, users;

CREATE TABLE users (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(75) NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE lessons (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    lesson_title VARCHAR(255) NOT NULL,
    lesson_text TEXT,
    video_url VARCHAR(255) DEFAULT 'No video resource attached',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE user_lessons (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    lesson_id INT NOT NULL,
    user_id INT NOT NULL,
    FOREIGN KEY (lesson_id) REFERENCES lessons(id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    completed BOOLEAN DEFAULT 0
);

CREATE TABLE tasks (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    user INT NOT NULL,
    FOREIGN KEY (user) REFERENCES users(id),
    task_title VARCHAR(255) NOT NULL,
    task_desc TEXT,
    due_at TIMESTAMP,
    task_complete BOOLEAN DEFAULT 0,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO users (id,username,email,password) 
	VALUES 
		(1,'mike',"mike@d.com",'password1'),
		(2,'tessa',"tessa@d.com",'password2'),
		(3,'zoe',"zoe@d.com",'password3'),
		(4,'luna',"luna@d.com",'password4'),
		(5,'scotty',"scotty@d.com",'password5');

INSERT INTO lessons (id,lesson_title,lesson_text,video_url) 
	VALUES 
		(1,'change a filter','Learn how to change your A/C filter',NULL),
		(2,'change your oil','Learn how to change the oil in your car','bing.com'),
		(3,'flush a water heater','Learn how to flush out the sediment in your water heater to extend its life','altavista.com'),
		(4,'find the right light bulb',NULL,'chatgpt.com');

INSERT INTO tasks (id,user,task_title,task_desc,due_at,task_complete) 
	VALUES 
		(1,1,'A/C filter','Change the filter; 16x25x1','2026-01-25',NULL),
		(2,1,'swap fridge filter','NULL',NULL,NULL),
		(3,1,'clean dryer vent','From inside and outside, flush out dryer vent','2026-02-12',0),
		(4,2,'clean gutters','Clear out all the gutters','2025-10-25',1),
		(5,3,'A/C filter','Filter swap','2026-02-01',1),
		(6,3,'clean gutters','Clear out all the gutters','2025-10-25',NULL),
		(7,4,'clean dryer vent','From inside and outside, flush out dryer vent','2026-02-12',0),
		(8,4,'Buy a new house','Generating sample data is mentally tiring.','2026-03-01',0);

COMMIT;