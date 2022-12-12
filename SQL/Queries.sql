/* getting price per book order */
SELECT book.book_price * book_order.quantity
FROM book, book_order
WHERE book.ISBN == book_order.ISBN AND book_order.order_no == 1;

/* getting order total price of order */
SELECT SUM(book_order_price)
FROM book_order, order
WHERE order.order_no == book_order.order_no;

/* */
SELECT *
FROM book
WHERE book_name in ();
