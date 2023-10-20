CREATE TABLE members (
  member_num INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50) NOT NULL,
  email VARCHAR(100) UNIQUE,
  phone VARCHAR(100) NOT NULL,
  password VARCHAR(255) NOT NULL,
  birthdate DATE,
  registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE members
modify COLUMN role ENUM('ROLE_USER', 'ROLE_ADMIN') DEFAULT 'ROLE_USER';

update members set role="ROLE_USER";

INSERT INTO members (username, email, phone, password, birthdate) 
VALUES ('홍길동', '1234@naver.com', '01011112222', '1234', '2001-02-02');

INSERT INTO members (username, email, phone, password, birthdate) 
VALUES ('갑을병', '4321@naver.com', '01011112222', '1234', '2001-02-02');


select * from members

delete from members

ALTER TABLE members DROP INDEX phone;

SHOW CREATE TABLE members;