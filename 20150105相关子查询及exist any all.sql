select description from product p,orders o where p.prdtnum = o.prdtnum;
select distinct description from product p,orders o where p.prdtnum = o.prdtnum;
select * from orders o where 'bike' = (select distinct description from product p,orders o where p.prdtnum = o.prdtnum);--提示"single-row subquery returns more than one row"
select * from product p where p.description = 'bike';--可能返回多条结果
select o.orderedon,o.name,o.quantity from orders o,product p where o.prdtnum = p.prdtnum and p.description = 'bike';
select * from orders o,product p where o.prdtnum = p.prdtnum and p.description = 'bike';--跟上一条相比，这显示出来了orders表和product表的所有列
select count(o.prdtnum) from orders o,product p where o.prdtnum = p.prdtnum group by o.prdtnum;--记得前面讲过的：group by中使用where语句时，where放在group by之前
select sum(p.price * o.quantity) total,count(p.prdtnum),p.prdtnum from orders o,product p where p.prdtnum = o.prdtnum group by p.prdtnum ; --查询每个产品的总销售额
select avg(p.price * o.quantity),p.prdtnum from orders o,product p where p.prdtnum = o.prdtnum group by p.prdtnum;--查询每个产品的平均销售额
select sum(p.price * o.quantity) total,count(p.prdtnum),p.prdtnum from orders o,product p where p.prdtnum = o.prdtnum group by p.prdtnum having sum(p.price * o.quantity) > (select avg(p1.price * o1.quantity) from orders o1,product p1 where o1.prdtnum = p1.prdtnum and o1.prdtnum = p.prdtnum);-- o1.prdtnum = p.prdtnum使子查询与主查询关联，这样先计算每组的平均值再与sum比较
select orderedon,name from orders where exists (select * from product where prdtnum = '1005');--当子查询返回的内容非空时exists返回true，否则返回false
select orderedon,name from orders where exists (select * from product where description = 'bik');--描述里并无符合'bike'的，故此查询结果为空
select orderedon,name from orders o where exists (select * from customer c where c.state = 'ne' and c.name = o.name);--查询内布拉斯加州的客户订单
select orderedon,name from orders where name IN (select name from customer where state = 'ne');--用in
select orderedon,name from orders where name = ANY (select name from customer where state = 'ne');--用any，跟上条一样的结果
select orderedon,name from orders where name = SOME (select name from customer where state = 'ne');--用some，跟上两条一样的结果
select orderedon,name from orders where name > ANY (select name from customer where state = 'ne');--在这个句式里可以用ANY或者SOME，不能用IN。IN相当于多个等号的作用，ANY和SOME可以用大于或小于的运算符
select orderedon,name from orders where name <> ALL (select name from customer where state = 'ne');--All表示满足其中所有的查询结果。此句式里，返回除all里面的所有










