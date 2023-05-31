    select * from dataset2;
	select * from dataset1;

-- total number of rows into our dataset:
	select count(*) from dataset1;
	select count(*) from dataset2;

-- Generating data for my Homestate and neighbourstate ordering by literacy level in both state:
	select * from dataset1 where state in ('Madhya pradesh', 'Uttar Pradesh')
    order by literacy desc; 

-- Calculating the total population of India:
	select sum(population) Total_population from dataset2;  
    
-- Average population Growth of India state wise:
	select state,avg(growth)*100 as Avg_Growth  from dataset1
    group by state ; 
    
-- Average round off sex-ratio of India state wise having the highest average ratio:
	select state,round(avg(Sex_Ratio),0) as Avg_Sex_Ratio  from dataset1
    group by state ;
    
-- Average literacy-rate of India state wise, having literacy-rate greater than 90:
    select state,round(avg(Literacy),0) as Avg_Literacy from dataset1
    group by state
    having Avg_Literacy > 90;
    
    
--  Top 3 state showing highest growth_rate:
	select state, avg(growth)*100 as Avg_Growth  from dataset1
    group by state order by  Avg_Growth desc
    limit 4; 
    
--  Fourth Highest district in terms of literacy:
	select * from ( select * from dataset1 order by literacy desc limit 4) as Literacy  order by Literacy limit 1; 
    
-- Top and Bottom Three state in literacy level:
	drop table if exists top_states;
	create table top_states(
    state varchar (50),
    topstate  float
    );
   
   insert into top_states(state,topstate)
    select state,round(avg(Literacy),0) as Avg_Literacy from dataset1
    group by state order by Avg_Literacy desc limit 3;
    
    select * from top_states; 
    ---------------------------------------------
	drop table if exists bottom_states;
	create table bottom_states(
    state varchar (50),
    Bottomstate  float);
   
   insert into bottom_states(state,bottomstate)
   select state,round(avg(Literacy),0) as Avg_Literacy from dataset1
   group by state order by Avg_Literacy  limit 3;
   
-- Union operator to combine both the table:
    select * from top_states 
    union
    select * from bottom_states; 
    
-- selecting district with letter 'A':
	select district from dataset1
	where district like 'a%';

-- selecting district with last second letter as 'S':
	select district from dataset1
    where district  like '%s_'; 
    
-- 
    
    
   
