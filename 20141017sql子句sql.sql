SELECT studentname, score, previousscore FROM scoretable;
SELECT studentname,SUM(SCORE) FROM scoretable GROUP BY studentname;
SELECT studentname,SUM(score), count(*) FROM scoretable GROUP BY studentname;
SELECT studentname,SUM(score), count(*) FROM scoretable GROUP BY studentname, score;
SELECT coursename FROM scoretable GROUP BY studentname;
SELECT * FROM orgchart WHERE SUM(salary) < 38000;
