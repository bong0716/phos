CREATE TABLE members (
  member_num INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50) NOT NULL,
  email VARCHAR(100) UNIQUE,
  phone VARCHAR(100) NOT NULL,
  password VARCHAR(255) NOT NULL,
  birthdate DATE,
  registration_date DATETIME DEFAULT CURRENT_TIMESTAMP,
  role ENUM DEFAULT 'ROLE_USER'
);

ALTER TABLE members
modify COLUMN role ENUM('ROLE_USER', 'ROLE_ADMIN') DEFAULT 'ROLE_USER';

ALTER TABLE members
modify COLUMN registration_date DATETIME DEFAULT CURRENT_TIMESTAMP;

update members set role="ROLE_ADMIN" where username='관리자';

INSERT INTO members (username, email, phone, password, birthdate, role) 
VALUES ('관리자', 'admin@naver.com', '01011112222', 'admin1234', '2001-02-02', 'ROLE_ADMIN');

INSERT INTO members (username, email, phone, password, birthdate) 
VALUES ('갑을병', '4321@naver.com', '01011112222', '1234', '2001-02-02');


select * from members

delete from members where username='관리자'

ALTER TABLE members DROP INDEX phone;

SHOW CREATE TABLE members;