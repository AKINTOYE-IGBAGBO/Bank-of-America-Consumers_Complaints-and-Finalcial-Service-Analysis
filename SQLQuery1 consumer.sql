select * from Consumer_Complaints

Update Consumer_Complaints 
SET Sub_product= 'Not identified'
where Sub_product is null

Update Consumer_Complaints 
SET Company_public_response= 'Not respone yet'
where Company_public_response is null


select 
count(distinct Complaint_ID) Total_Complaints
from Consumer_Complaints

select 
Year(Date_submitted) Year,
Count(Distinct Complaint_ID) Complaints
from Consumer_Complaints
group by Year(Date_submitted)
order by 1

select 
Product,
Count(Distinct Complaint_ID) Complaints
from Consumer_Complaints
group by Product
order by 2

select 
datename(month,Date_submitted) Month,
Count(Distinct Complaint_ID) Complaints
from Consumer_Complaints
group by datename(month,Date_submitted)
order by 2

select 
Issue,
Count(Distinct Complaint_ID) Complaints
from Consumer_Complaints
group by Issue
order by 2


select 
Sub_issue,
Count(Distinct Complaint_ID) Complaints
from Consumer_Complaints
group by Sub_issue
order by 2


select 
Sub_product,
Count(Distinct Complaint_ID) Complaints
from Consumer_Complaints
group by Sub_product
order by 2


select 
Product,
CAST
((Count(Distinct Complaint_ID) *100)/(select count(*) from Consumer_Complaints) AS decimal(10,2)) Product_distribution
from Consumer_Complaints
group by Product
order by 2

select 
Company_response_to_consumer,
CAST
((Count(Distinct Complaint_ID) *100)/(select count(*) from Consumer_Complaints) AS decimal(10,2)) Response_distribution
from Consumer_Complaints
group by Company_response_to_consumer
order by 2

select 
Company_public_response,
CAST
((Count(Distinct Complaint_ID) *100)/(select count(*) from Consumer_Complaints) AS decimal(10,2)) Public_response_distribution
from Consumer_Complaints
group by Company_public_response
order by 2

select
AVG(DATEDIFF(DAY,Date_submitted,Date_received)) Avg_Forwarding_interval
from Consumer_Complaints

select 
(count (Complaint_ID)*100)/ (select count (*) from Consumer_Complaints) Timely_response
from Consumer_Complaints
where Timely_response = 1

select 
Year(Date_submitted) Year,
Count(Distinct Complaint_ID)  - lag(Count(Complaint_ID)) over (order by Year(Date_submitted)) YoY_complaints
from Consumer_Complaints
group by Year(Date_submitted)
order by  1