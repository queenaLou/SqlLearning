select * from collection;
Insert into collection values('supermans cape',250,'tugged on it');--insert values��䲻��Ҫд����һ�У�sql�������������Ӧ���к���
insert into collection values('diyilie','','disanlie');--���ݲ���Ϊ�գ�����Ϊ''�����ż�û�пո�
insert into collection values('first',null,'third');--����ֱ����null��ʾ
insert into collection values('',200,'shishi');--��һ������ΪNOT NULL�����ڲ���ʱ�������ֵ����ʾ"cannot insert NULL into (%s)"
select * from collection where worth is null;--��ͨ��is null�������ող����������¼
insert into collection values('supermans cape',260,'hug');--item��������Ψһ���Լ�����������Ե������ظ�����ʱ����ʾΥ��ΨһԼ������"unique constraint (%s.%s) violated"
if not exists(select * from collection where item = 'supermans cape') insert into collections values('supermans cape',260,'hug');--oracle ����֧�ִ���䣬��ʾδ֪������
insert into blank(column1) select item from collection;--�����Ѿ�������blank����collection���е�item�в��뵽��char������
insert into blank(column2) select item from collection;--���Խ�number�в��뵽char�����У�����֮����"invalid number"
update collection set worth = 220 where item = 'first';--update�����﷨������char���ͱ�����''����number���Ͳ���Ҫ