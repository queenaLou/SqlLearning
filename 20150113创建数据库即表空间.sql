select username,default_tablespace from user_users;--��ѯ��ǰ�û��ı�ռ�
select * from user_role_privs;--��ѯ��ǰ�û��Ľ�ɫ
select * from user_tables;--��ѯ��ǰ�û������б�
create tablespace newtbs datafile 'D:\app\qa-2\product\11.2.0\dbhome_1\oradata\newtbs.dbf' size 50M extent management local uniform size 128k;--����һ��tablespace��Ϊnewtbs����СΪ50M�ı�ռ�
create user newuser identified by NewPassword1 default tablespace newtbs quota 10m on newtbs temporary tablespace temp password expire;--��newtbs�´����µ�user,Ĭ�ϱ�ռ���newtbs���ռ����Ϊ10M���´ε�½Ҫ���޸�����
Grant resource,connect,dba to newuser;--����newuser����Ȩ�ޣ�resource��connect��dba
select tablespace_name,sum(bytes)/1024/1024 from dba_data_files group by tablespace_name;--�鿴���б�ռ估���С����ռ�����Ϊ���ݿ⣩
