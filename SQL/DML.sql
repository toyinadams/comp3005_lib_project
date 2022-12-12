CREATE function add_book(isbn char(13), title text, no_of_pages int, price, 
inventory int, publ_name text, publ_email text, publ_address text, author_name text, genre_name text)
     
    WITH publ_addr as (
        INSERT INTO address (addr_id, address) 
        VALUES (default, 'publ_addresshgjg')
        RETURNING addr_id
        )
    INSERT INTO publisher (publ_addr_id) 
    SELECT addr_id
    FROM publ_addr;
    
    SELECT addr_id FROM publ_addr;
        
    RETURNING addr_id;


    INSERT INTO publisher
    VALUES (publ_name, publ_email, );
    


    INSERT INTO book
    VALUES (isbn, title)
)





ALTER SEQUENCE address_addr_id_seq RESTART WITH 0;
ALTER SEQUENCE author_author_id_seq RESTART WITH 0;
ALTER SEQUENCE genre_genre_id_seq RESTART WITH 0;
ALTER SEQUENCE order_genre_id_seq RESTART WITH 0;

INSERT INTO address
VALUES      ('9780385665308', 'Little Bee', 271, 29.95, 20, 'Doubleday Canada', random())
            ('9780156028356', 'TheColor Purple', 288, 20, '');

INSERT INTO book
VALUES      ('9780385665308', 'Little Bee', 271, 29.95, 20, 'Doubleday Canada', random())
            ('9780156028356', 'TheColor Purple', 288, 20, '');

INSERT INTO book
VALUES      ('9780385665308', 'Little Bee', 271, 29.95, 20, 'Doubleday Canada', random())
            ('9780156028356', 'TheColor Purple', 288, 20, '');