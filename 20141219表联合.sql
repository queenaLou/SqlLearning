select * from table1;
select * from table2;
select * from table1,table2;--table1��ÿһ�ж���table2��ÿһ�н������ϣ��������ǳ˻�ֵ
select * from customer;
select * from product;
select * from orders;
select o.orderedon,o.name,o.prdtnum,p.price,o.quantityremarks, from product p,orders o where p.prdtnum=o.prdtnum; --��ֵ����

