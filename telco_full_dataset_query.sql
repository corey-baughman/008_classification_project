use telco_churn;
select * from customers c
	left join customer_payments using(customer_id)
    left join customer_churn using(customer_id)
    left join customer_contracts using(customer_id)
    left join customer_details using(customer_id)
    left join customer_signups using(customer_id)
    left join customer_subscriptions using(customer_id)
    left join internet_service_types as ist 
		on c.internet_service_type_id = ist.internet_service_type_id
    left join contract_types as ct
		on c.contract_type_id = ct.contract_type_id
	left join payment_types as pt
		on c.payment_type_id = pt.payment_type_id
;  

select * from customers limit 5;  