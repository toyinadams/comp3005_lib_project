CREATE TABLE address
  (
     addr_id SERIAL NOT NULL, 
     address_info TEXT UNIQUE NOT NULL,
     PRIMARY KEY (addr_id)
  );

CREATE TABLE author
  (
     author_id   SERIAL NOT NULL, 
     author_name TEXT UNIQUE NOT NULL,
     PRIMARY KEY (author_id)
  );

CREATE TABLE genre
  (
     genre_id SERIAL NOT NULL, 
     genre_name TEXT UNIQUE NOT NULL,
     PRIMARY KEY (genre_id)
  );

CREATE TABLE usr
  (
     usr_email	       TEXT NOT NULL, 
     usr_pay_info     TEXT,
     usr_bill_addr_id INT, 
     usr_ship_addr_id INT,
     PRIMARY KEY (usr_email),
     FOREIGN KEY (usr_bill_addr_id) REFERENCES address(addr_id),
     FOREIGN KEY (usr_ship_addr_id) REFERENCES address(addr_id)
  );

CREATE TABLE publisher
  (
     publ_name	   TEXT,
     publ_email   TEXT UNIQUE, 
     publ_addr_id INT,
     banking_info TEXT,
     PRIMARY KEY (publ_name),
     FOREIGN KEY (publ_addr_id) REFERENCES address(addr_id)
  );

CREATE TABLE publ_phone_no
  (
     publ_name TEXT NOT NULL,
     phone_no  TEXT NOT NULL, 
     PRIMARY KEY (publ_name, phone_no),
     FOREIGN KEY (publ_name) REFERENCES publisher(publ_name)
  );

CREATE TABLE book 
  (
     ISBN        CHAR(13) NOT NULL, 
     book_title  TEXT NOT NULL, 
     no_of_pages INT, 
     book_price  NUMERIC(6,2) NOT NULL, 
     inventory   INT NOT NULL, 
     publ_name   TEXT NOT NULL,
     publ_perc   FLOAT(8),
     PRIMARY KEY (ISBN),
     FOREIGN KEY (publ_name) REFERENCES publisher(publ_name)
  );

/*
ISBN is 13 digits
*/

CREATE TABLE book_author
  (
     ISBN      CHAR(13) NOT NULL, 
     author_id INT NOT NULL,
     PRIMARY KEY (ISBN, author_id),
     FOREIGN KEY (ISBN) REFERENCES book(ISBN),
     FOREIGN KEY (author_id) REFERENCES author(author_id)
  );

CREATE TABLE book_genre
  (
     ISBN     CHAR(13) NOT NULL,
     genre_id INT NOT NULL,
     PRIMARY KEY (ISBN, genre_id),
     FOREIGN KEY (ISBN) REFERENCES book(ISBN),
     FOREIGN KEY (genre_id) REFERENCES genre(genre_id)
  );

CREATE TABLE ordr
  (
     order_no         BIGSERIAL NOT NULL, 
     order_date       TIMESTAMP NOT NULL, 
     ord_ship_addr_id INT NOT NULL, 
     ord_whs_addr_id  INT NOT NULL, 
     ord_bill_addr_id INT NOT NULL,
     ord_pay_info     TEXT NOT NULL, 
     total_price      NUMERIC(8,2), 
     usr_email        TEXT NOT NULL, 
     PRIMARY KEY (order_no),
     FOREIGN KEY (ord_ship_addr_id) REFERENCES address(addr_id),
     FOREIGN KEY (ord_whs_addr_id) REFERENCES address(addr_id),
     FOREIGN KEY (ord_bill_addr_id) REFERENCES address(addr_id),
     FOREIGN KEY (usr_email) REFERENCES usr(usr_email)
  );

CREATE TABLE book_order 
  (
     order_no         INT NOT NULL,
     ISBN             CHAR(13) NOT NULL, 
     quantity         INT NOT NULL, 
     book_order_price NUMERIC(6,2), 
     PRIMARY KEY (order_no, ISBN),
     FOREIGN KEY (order_no) REFERENCES ordr(order_no),
     FOREIGN KEY (ISBN) REFERENCES book(ISBN)
  );

CREATE TABLE order_status
  (
     order_no         INT NOT NULL,
     order_status     TEXT NOT NULL,
     PRIMARY KEY (order_no),
     FOREIGN KEY (order_no) REFERENCES ordr(order_no)
  );