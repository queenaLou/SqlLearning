select description from product p,orders o where p.prdtnum = o.prdtnum;
select distinct description from product p,orders o where p.prdtnum = o.prdtnum;
select * from orders o where 'bike' = (select distinct description from product p,orders o where p.prdtnum = o.prdtnum);--��ʾ"single-row subquery returns more than one row"
select * from product p where p.description = 'bike';--���ܷ��ض������
select o.orderedon,o.name,o.quantity from orders o,product p where o.prdtnum = p.prdtnum and p.description = 'bike';
select * from orders o,product p where o.prdtnum = p.prdtnum and p.description = 'bike';--����һ����ȣ�����ʾ������orders���product���������
select count(o.prdtnum) from orders o,product p where o.prdtnum = p.prdtnum group by o.prdtnum;--�ǵ�ǰ�潲���ģ�group by��ʹ��where���ʱ��where����group by֮ǰ
select sum(p.price * o.quantity) total,count(p.prdtnum),p.prdtnum from orders o,product p where p.prdtnum = o.prdtnum group by p.prdtnum ; --��ѯÿ����Ʒ�������۶�
select avg(p.price * o.quantity),p.prdtnum from orders o,product p where p.prdtnum = o.prdtnum group by p.prdtnum;--��ѯÿ����Ʒ��ƽ�����۶�
select sum(p.price * o.quantity) total,count(p.prdtnum),p.prdtnum from orders o,product p where p.prdtnum = o.prdtnum group by p.prdtnum having sum(p.price * o.quantity) > (select avg(p1.price * o1.quantity) from orders o1,product p1 where o1.prdtnum = p1.prdtnum and o1.prdtnum = p.prdtnum);-- o1.prdtnum = p.prdtnumʹ�Ӳ�ѯ������ѯ�����������ȼ���ÿ���ƽ��ֵ����sum�Ƚ�
select orderedon,name from orders where exists (select * from product where prdtnum = '1005');--���Ӳ�ѯ���ص����ݷǿ�ʱexists����true�����򷵻�false
select orderedon,name from orders where exists (select * from product where description = 'bik');--�����ﲢ�޷���'bike'�ģ��ʴ˲�ѯ���Ϊ��
select orderedon,name from orders o where exists (select * from customer c where c.state = 'ne' and c.name = o.name);--��ѯ�ڲ���˹���ݵĿͻ�����
select orderedon,name from orders where name IN (select name from customer where state = 'ne');--��in
select orderedon,name from orders where name = ANY (select name from customer where state = 'ne');--��any��������һ���Ľ��
select orderedon,name from orders where name = SOME (select name from customer where state = 'ne');--��some����������һ���Ľ��
select orderedon,name from orders where name > ANY (select name from customer where state = 'ne');--�������ʽ�������ANY����SOME��������IN��IN�൱�ڶ���Ⱥŵ����ã�ANY��SOME�����ô��ڻ�С�ڵ������
select orderedon,name from orders where name <> ALL (select name from customer where state = 'ne');--All��ʾ�����������еĲ�ѯ������˾�ʽ����س�all���������










