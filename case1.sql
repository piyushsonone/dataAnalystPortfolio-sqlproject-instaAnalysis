select * from sqlprojecttable1;


-- Number of jobs reviewed: Amount of jobs reviewed over time.
-- Your task: Calculate the number of jobs reviewed per hour per day for November 2020? 

select ds, hour(ds), count(*) as num_jobs_reviewed
from sqlprojecttable1
where ds>='11/01/2020' and ds < '12/01/2022'
group by ds, hour(ds);









-- Throughput: It is the no. of events happening per second.
-- Your task: Let’s say the above metric is called throughput. 
-- Calculate 7 day rolling average of throughput? For throughput, do you prefer daily metric or 7-day rolling and why?

select ds, event,
count(*) over (order by ds rows between 6 preceding and current row) as rolling_count
from sqlProjectTable1
order by ds;

-- Percentage share of each language: Share of each language for different contents.
-- Your task: Calculate the percentage share of each language in the last 30 days?
select language,
(COUNT(language) / (select count(*) FROM sqlprojecttable1)) * 100 AS language_percentage
from sqlprojecttable1
where ds>='11/01/2020' and ds < '12/01/2022'
group by language
order by language;


-- Duplicate rows: Rows that have the same value present in them.
-- Your task: Let’s say you see some duplicate rows in the data. How will you display duplicates from the table?
select *
from sqlprojecttable1
group by 1, 2, 3, 4, 5, 6, 7
having count(*) > 1;