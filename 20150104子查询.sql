select * from orders;
select * from product;
SELECT prdtnum from product where product.description like '%b%'; --like后面跟的是''
select * from orders where orders.prdtnum = (select PRODUCT.prdtnum from product where PRODUCT.description like '%b%');--子查询里用like符合条件的较多，返回结果可能不唯一。那么可以用IN，而= > 和 < 必须是一对一的
select * from orders where orders.prdtnum = (select prdtnum from product where product.description = 'bike');--子查询里用等值查询，确保唯一性
select avg(o.quantity * p.price) from orders o,product p where o.prdtnum = p.prdtnum;--要记得在订单和产品列表，计算订单金额时有一个隐形条件：两个表的产品编号一样
select * from orders o,product p where o.prdtnum = p.prdtnum;--当where子句里出现两个表的比较时，from里必须得有这两个表
select o.name,o.orderedon,o.quantity,p.price from orders o,product p where o.prdtnum = p.prdtnum and o.quantity * p.price > (select avg(o.quantity * p.price) from orders o,product p where o.prdtnum = p.prdtnum);--查询订单金额大于订单平均金额的相关订单，注意前面及后面的子查询语句里都有等值查询
select o.name,o.orderedon,(o.quantity * p.price) total from orders o,product p where o.prdtnum = p.prdtnum and o.quantity * p.price > (select avg(o.quantity * p.price) from orders o,product p where o.prdtnum = p.prdtnum);--乘积total可以加括号或不加括号
select c.name,c.phone from customer c where c.name in (select o.name from orders o,product p where o.prdtnum = p.prdtnum and o.quantity * p.price >(select avg(o.quantity * p.price) from orders o,product p where o.prdtnum = p.prdtnum));--给订单金额大于平均金额的客户发特定信息，用到了IN，等值查询，子查询的嵌套
select all * from customer;--没有select all from customer的用法
select distinct user from customer;--返回当前使用的用户
select name,avg(quantity) from orders group by name having avg(quantity) > (select avg(quantity) from orders);--前面已介绍过group by和Having都得跟汇总函数，这里表述的是：查找顾客平均数量大于总平均数量的顾客


