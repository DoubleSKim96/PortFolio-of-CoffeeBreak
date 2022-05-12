CREATE TABLE user_info2 (
	account VARCHAR(80) PRIMARY KEY,
	password VARCHAR(80) NOT NULL,
	name VARCHAR(100) NOT NULL,
	phoneNum INT NOT NULL,
	email VARCHAR(100) NOT NULL,
	session_id VARCHAR(80) NOT NULL DEFAULT 'none',
	limit_time TIMESTAMP
);

SELECT COUNT(*)
FROM user_info2
WHERE account='aaa123';

