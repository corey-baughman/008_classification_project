Observations:

1. This data seems to reflect churn for the month ending 1/31/2022 only.
2. We don't have ages for our customers.
3. Because we don't have other months or years of churn data, we can't do time series analysis.
4. It is going to be difficult to make recommendations when there is no history to reference.
5. Recommendations will likely take the form of education about correlation between churn and features in the current month as well as potential metrics to start tracking over time.
6. Upselling features:
    a. phone_service
    b. multiple_lines
    c. internet_service_type
    d. online_security
    e. online_backup
    f. device_protection
    g. tech_support
7. Note that streaming_tv and streaming_movies are not service offerings from Telco, they are just internal categories monitoring whether Telco internet customers use their internet to stream from other TV and movie providers.
    


Questions:

1. What kind of customers just have phone service?
2. What kind of customers just have internet service
3. How can we segment our customers?
    a. Gender
    b. Senior Citizen or no
    c. partner or no
    d. dependents or no
    e. Internet or no
    f. Type of internet service (DSL, Fiber optic, None)
    g. Add-on features
    h. Type of add-on features (see Observations 6.)
    i. Payment type
    j. Monthly charges
    k. Tenure
    l. Contract Type
    m. Total charges(a hybrid of tenure and monthly charges)
    n. Paperless billing users
    o. Sign-up date (did a bunch of customers sign up for a promotion and then leave when it ended?) Ultimately, may not be a very useful category as we don't have historical data on churn or promotions, etc.




Needs:

- DONE 1. total_charges dtype is object. Cast to float

- DONE 2. keep signup_date? Tenure already reflects most of this content. There could be something to time of day, week, month of signup relevant to churn, but I am going to disregard for now and drop signup_date
    
- DONE 3. Keep contract_type_id or encode contract_type? I think it preserves more human-readability to encode contract_type and drop contract_type_id.

- DONE 4. Keep internet_service_type_id or encode internet_service_type? I think it preserves more human-readability to encode internet_service_type and drop internet_service_type_id.

- DONE 5. Keep payment_type_id or encode payment_type? I think it preserves more human-readability to encode payment_type and drop payment_type_id.

- DONE 6. customer_id field is irrelavent after importing to a DataFrame and could be detrimental during modeling so will drop.

- DONE 7. Features to Encode:
    gender, partner, dependents, phone_service, multiple_lines, online_security, online_backup, device_protection, tech_support, streaming_tv, streaming_movies, paperless_billing, contract_type, internet_service_type, payment_type
    
    
    
Findings:
- Even using the more lenient parameter of zero AND one months for tenure, there were 624 new contracts, compared with 1869 churns. It appears Telco is bleeding out fast. Without historical data, we can't verify this trend, but for January 2022 it is very concerning.

biggest takeaways from the bivariate categoricals:
- Why are seniors leaving at such a high rate?
- Why are people without dependents or partners leaving at high rates?
- Why are people without add-on services leaving at such a high rate?