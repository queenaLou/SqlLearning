select * from orders;
select * from product;
SELECT prdtnum from product where product.description like '%b%'; --like���������''
select * from orders where orders.prdtnum = (select PRODUCT.prdtnum from product where PRODUCT.description like '%b%');--�Ӳ�ѯ����like���������Ľ϶࣬���ؽ�����ܲ�Ψһ����ô������IN����= > �� < ������һ��һ��
select * from orders where orders.prdtnum = (select prdtnum from product where product.description = 'bike');--�Ӳ�ѯ���õ�ֵ��ѯ��ȷ��Ψһ��
select avg(o.quantity * p.price) from orders o,product p where o.prdtnum = p.prdtnum;--Ҫ�ǵ��ڶ����Ͳ�Ʒ�б����㶩�����ʱ��һ������������������Ĳ�Ʒ���һ��
select * from orders o,product p where o.prdtnum = p.prdtnum;--��where�Ӿ������������ıȽ�ʱ��from����������������
select o.name,o.orderedon,o.quantity,p.price from orders o,product p where o.prdtnum = p.prdtnum and o.quantity * p.price > (select avg(o.quantity * p.price) from orders o,product p where o.prdtnum = p.prdtnum);--��ѯ���������ڶ���ƽ��������ض�����ע��ǰ�漰������Ӳ�ѯ����ﶼ�е�ֵ��ѯ
select o.name,o.orderedon,(o.quantity * p.price) total from orders o,product p where o.prdtnum = p.prdtnum and o.quantity * p.price > (select avg(o.quantity * p.price) from orders o,product p where o.prdtnum = p.prdtnum);--�˻�total���Լ����Ż򲻼�����
select c.name,c.phone from customer c where c.name in (select o.name from orders o,product p where o.prdtnum = p.prdtnum and o.quantity * p.price >(select avg(o.quantity * p.price) from orders o,product p where o.prdtnum = p.prdtnum));--������������ƽ�����Ŀͻ����ض���Ϣ���õ���IN����ֵ��ѯ���Ӳ�ѯ��Ƕ��
select all * from customer;--û��select all from customer���÷�
select distinct user from customer;--���ص�ǰʹ�õ��û�
select name,avg(quantity) from orders group by name having avg(quantity) > (select avg(quantity) from orders);--ǰ���ѽ��ܹ�group by��Having���ø����ܺ���������������ǣ����ҹ˿�ƽ������������ƽ�������Ĺ˿�


