select * from dictionary;--��ѯ�����ֵ��������Ϣ
Select * From DBA_CATALOG;--�����ֵ�������һ�������Ϣ
select table_name from dictionary;--��ѯ�����ֵ������еı�
select * from user_tables;--��ѯ��ǰ�û�ӵ�е����б����Ϣ����������/��ռ���/������
select index_name from user_indexes;--��ѯ���û�ӵ����Щ����
select view_name from user_views;--��ѯ���û�ӵ����Щ��ͼ
select object_name from user_objects;--�鿴�û�ӵ����Щ���ݿ����
select * from user_users;--�鿴�û�����Ϣ�������û���/�û�ID/�˻�״̬/Ĭ�ϱ�ռ��
select owner , object_name ,object_type from all_objects;--��ѯ���ж���
select * from dba_data_files;--��ѯ��ռ�/��ռ�洢·����

select * from v$access��
select * from v$session;
select * from v$context;