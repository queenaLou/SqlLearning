select p.prdtnum,o.prdtnum from product p join orders o on o.prdtnum= 1001 --�ڲ�����
select o.name,p.prdtnum from product p right outer join orders o on o.prdtnum = 1001 --������
select p.prdtnum,o.prdtnum from product p left outer join orders o on o.prdtnum = 1001 --������
select p.prdtnum pn1,o.prdtnum pn2 from product p,orders o where o.prdtnum = p.prdtnum(+);--�����+�Ŵ����ⲿ���ϣ��Ⱥ�ǰ���orders��ᱻȫ����ʾ����
select o.prdtnum pn1,p.prdtnum pn2 from orders o,product p where o.prdtnum = p.prdtnum(+);
select p.prdtnum pn1,o.prdtnum pn2 from prduct p join orders o on o.prdtnum = 1001;
select * from orders
select name,description from orders s,product p where name like'%r%';--�ɶ��Բ��õ�sql���
select distinct p.prdtnum,p.description,d.prdtnum,d.description from product p,product d where p.prdtnum = d.prdtnum and p.description <> d.description; --ͬ���ļ�¼��������Σ�distinct��������