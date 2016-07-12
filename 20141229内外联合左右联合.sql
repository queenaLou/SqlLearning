select p.prdtnum,o.prdtnum from product p join orders o on o.prdtnum= 1001 --内部联合
select o.name,p.prdtnum from product p right outer join orders o on o.prdtnum = 1001 --右联合
select p.prdtnum,o.prdtnum from product p left outer join orders o on o.prdtnum = 1001 --左联合
select p.prdtnum pn1,o.prdtnum pn2 from product p,orders o where o.prdtnum = p.prdtnum(+);--这里的+号代表外部联合，等号前面的orders表会被全部显示出来
select o.prdtnum pn1,p.prdtnum pn2 from orders o,product p where o.prdtnum = p.prdtnum(+);
select p.prdtnum pn1,o.prdtnum pn2 from prduct p join orders o on o.prdtnum = 1001;
select * from orders
select name,description from orders s,product p where name like'%r%';--可读性不好的sql语句
select distinct p.prdtnum,p.description,d.prdtnum,d.description from product p,product d where p.prdtnum = d.prdtnum and p.description <> d.description; --同样的记录会出现两次，distinct不能消除