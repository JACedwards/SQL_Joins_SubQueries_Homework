
--Question 1:
	--List all customers who live in Texas

--Answer 1:
	--Kim Cruz
	--Jennifer Davis
	--Bryan	Hardison
	--Ian Still
	--Richard Mccrary

select first_name, last_name
from customer
join address
on customer.address_id = address.address_id
where address.district = 'Texas';



--Question 2: 
	-- Get all payments above $6.99 with the Customer's Full Name

--Answer 2:
	--Too many to list, so you can run code below if needed.

select first_name, last_name, sum(payment.amount)
from customer
join payment
on customer.customer_id = payment.customer_id
group by customer.customer_id, first_name, last_name
having sum(payment.amount) > 6.99;


--Question 3: 
	--Show all customers names who have made payments over $175(use subqueries)

--Answer to Question 3:
	--I am pretty sure that Sam did one very much like this if not identical
	--during lecture today.  So, I did not look at that similar/identical
	--one while writing script for this query.  Instead, I used his
	--example of getting data for actor who appeared in at least
	--30 films as a model.

	--Results are that the following all made payments of over $175 (I think):
		--Harold Martino
		--Douglas Graf
		--Rhonda Kennedy
		--Clara	Shaw
		--Marion Snyder
		--Elizabeth	Brown
		--Jennifer Davis
		--Eleanor Hunt
		--Peter	Menard
		--Karl Seal
		--Tommy	Collazo
		--Mildred Bailey		

select first_name, last_name
from customer
where customer_id in(
	select customer_id
	from payment
	group by customer_id
	having sum(amount) > 175
);


--Question 4:
	--List all customers that live in Nepal (use the city table)

--Answer for Question 4:
	--No one

select customer.address_id, first_name, last_name, city.city_id, city 
from customer
join address
on customer.address_id = address.address_id 
join city
on address.city_id = city.city_id
where city.city = 'Nepal';



--Question 5:  Which staff member had the most transactions?

--Answer for Question 5:
	--Jon Stephens has the most.  Below was closest I could come to an output
	--that directly identified who had most transactions. I saw that there 
	--were only two staff members, so I ran the below query with where id = 1
	--then where id = 2, and used the "Calculate total row count" button below
	--to check who had the most rows/transations.

select count(payment.staff_id), payment_id, first_name, last_name
from staff
join payment
on staff.staff_id = payment.staff_id
where payment.staff_id = 2
group by payment.payment_id, first_name, last_name;



--Question 6:
	--How many movies of each rating are there?

--Answer for Question 6:  This one didn't need a join(?)
	--PG-13	223
	--NC-17	209
	--G	179
	--PG 194
	--R	195

select rating, count(title)
from film
group by rating;




--Question 7:  Show all customers who have made a single payment above $6.99 (Use Subqueries)

--Answer to Question 7:
	--I got 598 people/rows, so won't list them here.

select first_name, last_name
from customer
where customer_id in(
	select customer_id
	from payment
	group by customer_id
	having sum(amount) > 6.99
)
order by last_name;



--Question 8: How many free rentals did our stores give away?

--Answer to Question 8:  This one didn't need a join either. 
	--I didn't know whether "free" meant exactly 0 for an amount 
	--or should include negative numbers too, so I ran both ways

	--23 rentals were for $0.
	--53 rentals were less than or equall to $0

 select count(amount) 
 from payment
 where amount <= 0;




