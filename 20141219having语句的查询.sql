SELECT * FROM orgchart;
SELECT team,AVG(salary) PJGZ FROM ORGCHART GROUP BY TEAM ORDER BY PJGZ;
select team,avg(salary) from ORGCHART group by team having avg(salary) > 37500;
select team,avg(salary) pjgz from orgchart group by team having pjgz > 37500;--ORA-00904: "PJGZ": 标识符无效 00904. 00000 -  "%s: invalid identifier" 
select team,avg(salary) from ORGCHART group by team having salary < 38000;--ORA-00979: 不是 GROUP BY 表达式 00979. 00000 -  "not a GROUP BY expression"
select team,avg(sickleave),avg(annualleave) from ORGCHART group by team having avg(sickleave) > 25 and avg(annualleave)<20;
select team,avg(salary) from orgchart group by team having team like'%p%';
select name,salary,sickleave from orgchart where sickleave < 25 order by name;
select team,avg(salary),avg(sickleave),avg(annualleave) from orgchart group by team;
select team,avg(salary) from orgchart group by team order by name;--出错 ORA-00979: 不是 GROUP BY 表达式 00979. 00000 -  "not a GROUP BY expression"
select team,avg(sickleave) from orgchart group by team having avg(sickleave)>26;
select team,count(*) from orgchart  where sickleave > 22 group by team;




