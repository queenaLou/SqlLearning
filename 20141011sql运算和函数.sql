SELECT * FROM COURSETABLE
SELECT * FROM SCORETABLE
SELECT * FROM STUDENTTABLE
SELECT AGE,(AGE+2) NEWAGE FROM studenttable
SELECT -STUDENTNAME FROM studenttable
SELECT AGE,MOD(AGE,2) FROM studenttable
SELECT * FROM scoretable WHERE PREVIOUSSCORE IS NULL
SELECT * FROM scoretable WHERE PREVIOUSSCORE = NULL
SELECT * FROM studenttable WHERE STUDENTNAME != 'Queena'
SELECT * FROM SCORETABLE WHERE SCORE<=99
SELECT * FROM studenttable WHERE STATE<>'NC'
SELECT * FROM studenttable WHERE STUDENTNAME LIKE '_n'
SELECT * FROM studenttable WHERE AGE LIKE '_3'
SELECT firstname||','||studentname FULLNAME FROM studenttable 
SELECT * FROM studenttable WHERE AGE=23 AND studentid LIKE '%5'
SELECT * FROM scoretable WHERE SCORE- previousscore>0
SELECT studentname FROM studenttable MINUS SELECT studentname FROM scoretable
SELECT * FROM studenttable INTERSECT SELECT * FROM scoretable
SELECT * FROM studenttable WHERE AGE BETWEEN 21 AND 23
SELECT * FROM studenttable WHERE AGE >= 21 AND AGE <= 23
SELECT COUNT(*) FROM studenttable WHERE AGE <23
SELECT COUNT(*) TOTAL FROM studenttable WHERE AGE <23
SELECT COUNT(AGE) FROM studenttable WHERE AGE <23
SELECT COUNT(*) TOTAL FROM studenttable 
SELECT SUM(coursescore) TOTALSCORE FROM coursetable 
SELECT AVG(coursescore) TOTALSCORE FROM coursetable 
SELECT studentname FROM studenttable WHERE AGE=MAX(AGE)
SELECT MIN(studentname),MAX(studentname) MAXAGE FROM studenttable
SELECT VARIANCE(studentname) FROM studenttable
SELECT ENDDATE, add_months(ENDDATE, 2)NEWDATE FROM coursetable
SELECT COURSENAME,STARTDATE,ENDDATE FROM coursetable WHERE add_months(startdate, 4)> enddate