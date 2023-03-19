# 008_classification_project
Repo for CodeUp Project Examining Customer Churn from a Set of Telco Data

This is a CodeUp Data Science program to practice working through the whole data science pipeline for a Machine Learning classification problem. We were provided with a sql database of customer data from a Telecommunications Company. We have been tasked with analyzing the data to look for factors contributing to customer churn ('churn' is losing a customer).

This dataset seems to have been created by IBM for exploratory purposes. There are updated versions of it that add more features. The following data dictionary is pulled from details here:
https://community.ibm.com/community/user/businessanalytics/blogs/steven-macko/2019/07/11/telco-customer-churn-1113

Target variable: churn

The features in this dataset are as follows:

customer_id: A unique ID that identifies each customer. Dtype: object

gender: The customer’s gender: Male, Female.  Dtype: object

senior_citizen: Indicates if the customer is 65 or older: 0, 1.  Dtype: int64

partner: ('married' in the reference) Yes, No.  Dtype: object

dependents: Indicates if the customer lives with any dependents: Yes, No. Dependents could be children, parents, grandparents, etc. Dtype: object

tenure: Tenure in Months: Indicates the total amount of months that the customer has been with the company.  Dtype: int64

phone_service: Indicates if the customer subscribes to home phone service with the company: Yes, No.  Dtype: object 

multiple_lines: Indicates if the customer subscribes to multiple telephone lines with the company: Yes, No  Dtype: object

internet_service_type_id: Integer value corresponding to internet_service_type: 1 = DSL, 2 = Fiber Optic, 3 = None Dtype: int64

online_security: Indicates if the customer subscribes to an additional online security service provided by the company: Yes, No. Dtype: object

online_backup: Indicates if the customer subscribes to an additional online backup service provided by the company: Yes, No.  Dtype: object

device_protection: Indicates if the customer subscribes to an additional device protection plan for their Internet equipment provided by the company: Yes, No. Dtype: object

tech_support: Indicates if the customer subscribes to an additional technical support plan from the company with reduced wait times: Yes, No.  Dtype: object

streaming_tv: Indicates if the customer uses their Internet service to stream television programming from a third party provider: Yes, No. The company does not charge an additional fee for this service. Dtype: object

streaming_movies: Indicates if the customer uses their Internet service to stream movies from a third party provider: Yes, No. The company does not charge an additional fee for this service. Dtype: object

contract_type_id: Integer value corresponding to contract_type: 1 = Month-to-month, 2 = One year, 3 = Two year Dtype: int64

paperless_billing: Indicates if the customer has chosen paperless billing: Yes, No. Dtype: object

payment_type_id: Integer value corresponding to payment_type: 1 = 
Electronic check, 2 = Mailed check, 3 = Bank tranfer (automatic), 4 = Credit card (automatic). Dtype: int64

monthly_charges: Indicates the customer’s current total monthly charge for all their services from the company. Dtype: float64

total_charges: Indicates the customer’s total charges, calculated to the end of the quarter specified above.  Dtype: object

churn: Yes = the customer left the company. No = the customer remained with the company. Dtype: object

churn_month: this represents the report month for this dataset. The only value is 2022-01-31. Dtype: object

signup_date: a date time stamp for when the customer signed up with Telco. Dtype: object

internet_service_type: Indicates if the customer subscribes to Internet service with the company: DSL, Fiber Optic, None.  Dtype: object

contract_type: Indicates the customer’s current contract type: Month-to-Month, One Year, Two Year.  Dtype: object

payment_type: Indicates how the customer pays their bill: Electronic Check, Mailed Check, Bank Transfer (automatic), Credit Card (automatic).  Dtype: object


**Univariate Feature Analysis Results:**

Categorical Varibles:

Gender: is nearly balanced at 50.5% Male to 49.5% Female.

Senior Citizens: Only 16.2% of the sample were 65 or older.

Partner: The sample is almost evenly split between partnered (48.3%) and single (51.7%) people.

Dependents: Only 30% of the sample has dependents.

Phone Service: An astounding 90.3% of the sample has phone_service with Telco.

Multiple Lines: 42.2% of the sample have more than one line

Online Security: 28.7% of the sample subscribe to online security.

Online Backup: 34.5% of sample subscribe to online backup.

Device Protection: 34.4% of sample subscribe to device protection.

Tech Support: 29.0% of sample pay for premium tech support.

Streaming TV: 38.4% of sample use a TV streaming service over their Telco internet connection

Streaming Movies: 38.8% of sample use a movie streaming service over their Telco internet connection

Paperless Billing: 59.2% of sample is signed up for paperless billing.

Churn: In the month of Jan 2022, a whopping 26.5% of customers churned.

Churn Month: All of the churn values are 2022-01-31. We are looking at just one month's data as far as I can tell.

Internet Service Type: 21.7% had no internet w/Telco, 34.3% had DSL and 44.0% had Fiber Optic internet.

Contract Type: 55.0% month-to-month, 20.9% one-year contract, 24.1% two-year contract.

Payment Type: 22.9% mail a check, 33.6% electronic check, 21.6% credit card, 21.9% bank tranfer


Numerical Variables:

Tenure: The histogram of customer tenure in months is a U-shaped distribution. The most common tenure falls into the 0-7 month bracket with about 1600 customer. The second largest category is between about 65 and 72 months with about 1100 customers. There are no customers with a tenure more than about 72 months (6 years) so I will make the assumption that is when the company started. The distribution between those two groups is relatively uniform  with 7 of the 10 brackets between about 500 and 600 customers. Tenure is certainly not normally distributed, but the sample size is over 7000. The box plot for tenure shows Q1 at about 9 months, a median of about 29, and Q3 of about 55 months.

Monthly Charges: The distribution of monthly charges is relatively normal with the exception of a massive block of customers in the $20/mo range (about 1600). The box plot shows Q1 about $35, median about $70, and Q3 about $90. $20 seems to be the minimum and about $120/mo is the max.

Total Charges: which tell the story of tenure * monthly cost, have the vast majority us customers in the lowest bracket of under $10k. Highest total_charges run upwards of $80k but the box plot shows that anything over about $10k is an outlier.

**Takeaway Thoughts and Questions:**

1. The $20/mo plan needs more exploration. It seems to be a significant part of the business. Who are the people on that plan? Are they churning?

2. Who are the very large number of customers in the shortest tenure bucket (<= 6mo.). Why are they leaving? Is it cost? What plans are they on?

3. On the other end of the spectrum, who are the people with the longest tenure? Did they get a great signup deal when the company first started? Are they just the kind of people who value stability more than bottom line price?

4. To get an idea of customer outflows v inflows, I counted tenures of 0 and one month at 624 which should represent new customers in the period. Churn for the period was 1869, almost 3x customers are leaving v signing up. OUCH!

**Univariate Exploration Summary**

Almost a quarter of Telco customers seem to be on the cheapest plan at around $20/mo. That demographic needs to be understood. The other notable feature is the bimodal nature of customer tenure. Almost a quarter of customers churn in the first 7 months, but more than 15% of customers have stuck with the company since the beginning. Understanding those two groups should give more insight into potential reasons for churn and possibly help Telco tailor marketing to 1) the type of customer who tends to stay and 2) find ways to adjust services to stem the bleeding in the first seven months.

**Bivariate Analysis**





