update collection set item = 'check',worth = 200 where item = 'supermans cape';--����һ����¼�Ķ���ֶ�
update collection set worth = 200;--��û��where��䣬������ֶε��������ݶ������µ���һ��Ҫע��
delete from collection where worth < 199;--û��ȷ��ɾ������ʾ��ֱ�Ӿ�ɾ���ˣ�
delete from blank;--����ʹ��where��䣬���м�¼��ɾ��
insert into collection values('chia pet',5,'wedding gift');
insert into collection values('trs model III',50,'first computer');
insert into blank(column1,column2,column3) select item,worth,remarks from collection;
update blank set column2 = 6 where column1 = 'chia pet';
update blank set column2 = 66 where column1 = 'trs model III';
insert into collection select * from blank;--��ԭ����������˳����룬����ԭ�������ظ���������unique���ԣ��ᵯ��������blank�����С��collection���е�������"not enough values"
drop table blank;--ɾ����
create table blank(column1 char(100),column2 number,column3 char(100));--������
insert into collection select * from collection;--����INSERT ����еı����� FROM �еı���ͬ
delete * from collection;--��һ��*�ţ�������ʾ"invalid table name"
rollback;--������һ�β���
update collection set item = 'howw' set worth = 300;--����set��������ʾ"SQL command not properly ended"
insert into collection(item) values('23');--����һ������Ӧ���������ͣ���ʾ��"SQL command not properly ended"

--������봴�����ݿ��ѧϰ
CREATE DATABASE mydatabase;--������ʾ�����ݿ���װ�ء���ԭ�����ڲ���



