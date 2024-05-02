USE sakila

# First, create a view that summarizes rental information for each customer. The view should include the customer's ID, name, email address, and total number of rentals (rental_count).
CREATE VIEW rental_info AS
SELECT
    customer.customer_id,
    customer.first_name,
    customer.email,
    COUNT(rental.customer_id) AS rental_count
FROM
    customer
JOIN
    rental ON rental.customer_id = customer.customer_id
GROUP BY
    customer.customer_id;	
# step 2 
CREATE TEMPORARY TABLE total_paid 
SELECT 
		rental_info.costumer_id, SUM(payment_amount) AS total_paid
FROM
	rental_info
JOIN payment on retal_info.costumer_id = paymenmt.costumer_id
GROUP BY rental_info_id;
# step 3 
CREATE TEMPORARY TABLE rental_sumary 
SELECT
costumer.costumer_id,
costumer.first_name,
costumer.mail,
COUNT(rental.customer_id) AS rental_count,
rental_info.costumer_id, SUM (payment.amount) as 
