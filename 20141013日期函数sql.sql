select * from coursetable
select * from coursetable WHERE add_months(startdate, 3) > enddate
SELECT ENDDATE,LAST_DAY(ENDDATE) FROM coursetable
SELECT DISTINCT LAST_DAY('1-FEB-95')NONLEAP,LAST_DAY('1-FEB-96') LEAP FROM coursetable
SELECT ENDDATE,STARTDATE, months_between(ENDDATE, STARTDATE) FROM coursetable
SELECT * FROM coursetable WHERE months_between(enddate, '31-DEC-14') >0
SELECT ENDDATE edt,NEW_TIME(enddate,'EDT','PDT') FROM coursetable
SELECT ENDDATE,NEXT_DAY(ENDDATE,'FRIDAY') FROM coursetable
SELECT DISTINCT SYSDATE FROM coursetable
SELECT * FROM coursetable WHERE startdate < sysdate
SELECT * FROM NUMBERS
SELECT A, abs(A) FROM numbers
SELECT a, ceil(a), floor(a), b, ceil(b), floor(b) FROM numbers
SELECT a,SIN(a),SIN(a * 0.017453) FROM numbers
SELECT A, exp(A) FROM numbers
SELECT A,LN(A) FROM numbers
SELECT B,LOG(B,10) FROM numbers
SELECT A,B,MOD(A,B) FROM numbers
SELECT A,B, power(A, B) FROM numbers
