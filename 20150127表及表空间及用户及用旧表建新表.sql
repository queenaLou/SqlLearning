SELECT 1 || 2 FROM testdatatwo;--||�������ǽ��ַ����ӣ���Oracle���Զ�����ת�����ܣ�������Ҳ������
Alter Table testdatatwo Add (dat Date);
select instance_name from  V$instance;--�鿴ʵ���������ݿ�ID��
select tablespace_name,sum(bytes)/1024/1024 from dba_data_files group by tablespace_name;--�鿴���б�ռ估���С����ռ�����Ϊ���ݿ⣩
Select Tablespace_Name,Sum(bytes)/1024/1024 From Dba_Segments Group By Tablespace_Name;
Select username,account_status From dba_users;--�鿴�����û������䱻��״̬
select username,default_tablespace from dba_users;--�鿴�����û�������Ĭ�ϱ�ռ�
select username,default_tablespace from user_users;--��ѯ��ǰ�û��ı�ռ�
Select Segment_Name,Sum(bytes)/1024/1024 From User_Extents Group By Segment_Name;--�鿴���б����С
Create Table newtable2(field1,field2,field3,field4,field5) As (Select * from testdatatwo where testpre != 300);--���Ѿ����ڵı���һ���±������ֶ��������ݣ������
Create Table newtable3(field1,field2) As (Select zifuchuan,testnumber From testdatatwo);--����һ��ֻ�������ֶε��±����ݸ��ϱ�һ��
