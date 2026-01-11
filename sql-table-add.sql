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
    completed BOOLEAN DEFAULT FALSE
);

CREATE TABLE tasks (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    user INT NOT NULL,
    FOREIGN KEY (user) REFERENCES users(id),
    task_title VARCHAR(255) NOT NULL,
    task_desc TEXT,
    due_at TIMESTAMP,
    task_complete BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

COMMIT;