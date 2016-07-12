select * from table1;
select * from table2;
select * from table1,table2;--table1的每一行都与table2的每一行进行联合，总行数是乘积值
select * from customer;
select * from product;
select * from orders;
select o.orderedon,o.name,o.prdtnum,p.price,o.quantityremarks, from product p,orders o where p.prdtnum=o.prdtnum; --等值联合

