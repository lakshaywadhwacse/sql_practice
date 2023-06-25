-- Given team names and winner name
-- output -> team_name no_of_matches matches_won no_of_looses



create table `wmt-cill-dev.bq_prac.icc_world_cup`
(
Team_1 string,
Team_2 string,
Winner string
);

select * from `wmt-cill-dev.bq_prac.icc_world_cup`;

with win_table as(
select Team_1 as team_name, case when Team_1=Winner then 1 else 0 end as win_flag from `wmt-cill-dev.bq_prac.icc_world_cup`
union all
select Team_2 as team_name, case when Team_2=Winner then 1 else 0 end as win_flag from `wmt-cill-dev.bq_prac.icc_world_cup`
)
select team_name , count(1) as no_of_matches, sum(win_flag) as matches_won , count(1)-sum(win_flag) as no_of_looses
from win_table group by team_name


